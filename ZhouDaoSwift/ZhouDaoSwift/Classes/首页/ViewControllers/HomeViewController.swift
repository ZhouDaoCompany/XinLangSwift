//
//  HomeViewController.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    //MARK: Methods
    func initUI() -> Void {
        
        self.setupNaviBarWithTitle(title: "首页")
        self.view.addSubview(self.webView)
        
        ZDNetWorkManger.getWithUrl("api_recom.php?key=16248ef5&c=indexAll", params: [:], success: { (response) in
            
            
        }) { (error) in
            
        }
    }
    
    //MARK: setters and getters
    private var webView : UIWebView {
        
        let web = UIWebView(frame: CGRect(x: CGFloat(0.0), y: CGFloat(64.0), width: ScreenWidth, height: ScreenHeight - 64))
        web.backgroundColor = UIColor.clear
        let request = NSURLRequest(url: URL(string: "https://www.baidu.com")!)
        web.loadRequest(request as URLRequest)
        return web
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
