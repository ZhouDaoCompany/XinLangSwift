//
//  ZDCircleScrollView.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/11/28.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit
import Kingfisher

typealias ZDBAdPageCallback = (_ clickIndex: Int) -> Void

protocol ZDBAdPageViewDelegate {
    
    /**
     *  加载网络图片使用回调自行调用SDImage
     *
     *  @param imgView
     *  @param imgUrl
     */

    func setWebImage(_ imgView: UIImageView, imgUrl: String)
}

class ZDCircleScrollView: UIView, UIScrollViewDelegate {
    
    var iDisplayTime: Int = 0
//    var bWebImage: Bool!
    var pageControl: UIPageControl!
    
    var indexShow : Int = 0
    var arrImage : [Any] = []
    var scView : UIScrollView!
    var imgPrev : UIImageView!
    var imgCurrent : UIImageView!
    var imgNext : UIImageView!
    var myBlock : ZDBAdPageCallback!
    var delegate : ZDBAdPageViewDelegate!
    
    var myTimer : Timer!
    
    var WIDTH : CGFloat = 0
    var HEIGHT : CGFloat = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        WIDTH = self.frame.size.width
        HEIGHT = self.frame.size.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        
        scView = UIScrollView.init(frame: self.frame)
        scView.delegate = self
        scView.isPagingEnabled = true
        scView.bounces = false
        scView.contentSize = CGSize(width: WIDTH * 3, height: HEIGHT)
        scView.showsVerticalScrollIndicator = false
        scView.showsHorizontalScrollIndicator = false
        scView.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(scView)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAds))
        scView.addGestureRecognizer(tap)
        
        // 创建 UIImageView
        imgPrev = UIImageView.init(frame: CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: WIDTH, height: HEIGHT))
        imgCurrent = UIImageView.init(frame: CGRect(x: WIDTH, y: CGFloat(0.0), width: WIDTH, height: HEIGHT))
        imgNext = UIImageView.init(frame: CGRect(x: WIDTH * 2, y: CGFloat(0.0), width: WIDTH, height: HEIGHT))
        
        scView.addSubview(imgPrev)
        scView.addSubview(imgCurrent)
        scView.addSubview(imgNext)
        
        pageControl = UIPageControl.init(frame: CGRect(x: CGFloat(0.0), y: HEIGHT - 10, width: WIDTH, height: 10))
        pageControl.currentPageIndicatorTintColor = RGB(r: 0, 200, 170)
        pageControl.pageIndicatorTintColor = UIColor.white
        self.addSubview(pageControl)

    }
    
    override func layoutSubviews() {
        
        imgPrev.frame = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: WIDTH, height: HEIGHT)
        imgCurrent.frame = CGRect(x: WIDTH, y: CGFloat(0.0), width: WIDTH, height: HEIGHT)
        imgNext.frame = CGRect(x: WIDTH * 2, y: CGFloat(0.0), width: WIDTH, height: HEIGHT)
    }
    
    
    /**
     *  启动函数
     *
     *  @param imageArray 设置图片数组
     *  @param block      block，回调点击
     */

    private func startAdsWithBlock(_ imageArray: Array<Any>, block:@escaping ZDBAdPageCallback) {
        
        if imageArray.count <= 1 {
            pageControl.isHidden = true
            scView.contentSize = CGSize(width: WIDTH, height: HEIGHT)
        } else {
            pageControl.isHidden = false
        }
        
        pageControl.numberOfPages = imageArray.count
        arrImage = imageArray
        self.myBlock = block
        reloadImages()
    }
    /**
     *  停止广告轮播，释放内存
     *  不再使用 ZDBAdPageView 时，先调用 stopAds，释放 timer占用，从runloop中退出。否则会常驻内存。
     */
   private func stopAds() {
        
        if (myTimer != nil) {
            myTimer.invalidate()
        }
    }
    
    // MARK: 点击广告
    @objc private func tapAds() {
        
        if (myBlock != nil) {
            
            myBlock(indexShow)
        }
        if (myTimer != nil) {
            myTimer.invalidate()
        }
        if iDisplayTime > 0 {
            startTimerPlay()
        }
    }
    
    // MARK: 加载图片顺序
    private func reloadImages() {
        if indexShow >= arrImage.count {
            indexShow = 0
        }
        if indexShow < 0 {
            indexShow = arrImage.count - 1
        }
        
        var prev = indexShow - 1
        if prev < 0 {
            prev = arrImage.count - 1
        }
        var next = arrImage.count - 1
        if next > arrImage.count - 1 {
            next = 0
        }
        
        pageControl.currentPage = indexShow
        let prevImage  =  URL(string: "\(arrImage[prev])")
        let curImage   =  URL(string: "\(arrImage[indexShow])")
        let nextImage  =  URL(string: "\(arrImage[next])")
        
        if delegate != nil {
            
            imgPrev.kf.setImage(with: prevImage,
                                placeholder: UIImage(named: "home_Shuff"),
                                options: [.transition(ImageTransition.fade(1))],
                                progressBlock: { receivedSize, totalSize in
            },
                                completionHandler: { image, error, cacheType, imageURL in
            })
            
            imgPrev.kf.setImage(with: curImage,
                                placeholder: UIImage(named: "home_Shuff"),
                                options: [.transition(ImageTransition.fade(1))],
                                progressBlock: { receivedSize, totalSize in
            },
                                completionHandler: { image, error, cacheType, imageURL in
            })
            
            imgPrev.kf.setImage(with: nextImage,
                                placeholder: UIImage(named: "home_Shuff"),
                                options: [.transition(ImageTransition.fade(1))],
                                progressBlock: { receivedSize, totalSize in
            },
                                completionHandler: { image, error, cacheType, imageURL in
            })
        }
        
        
        scView.scrollRectToVisible(CGRect(x: WIDTH, y: CGFloat(0.0), width: WIDTH, height: HEIGHT), animated: false)
        if iDisplayTime > 0 {
            startTimerPlay()
        }
    }
    // MARK:  切换图片完毕事件 scrollView
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if myTimer != nil {
            
            myTimer.invalidate()
        }
        if scrollView.contentOffset.x > WIDTH * 2 {
            
            indexShow += 1
        } else if (scrollView.contentOffset.x < WIDTH) {
            indexShow -= 1
        }
        reloadImages()
    }
    
    private func startTimerPlay() {
        
        myTimer = Timer.scheduledTimer(timeInterval: TimeInterval(iDisplayTime), target: self, selector: #selector(doImageGoDisplay), userInfo: nil, repeats: false)
    }
    
    // MARK: 轮播图片
    @objc private func doImageGoDisplay() {
        
        scView.scrollRectToVisible(CGRect(x: WIDTH, y: CGFloat(0.0), width: WIDTH, height: HEIGHT), animated: true)
        indexShow += 1
        reloadImages()
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
