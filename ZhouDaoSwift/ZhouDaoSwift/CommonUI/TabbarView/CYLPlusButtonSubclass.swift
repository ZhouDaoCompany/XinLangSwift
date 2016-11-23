//
//  CYLPlusButtonSubclass.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/11/23.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

class CYLPlusButtonSubclass: CYLPlusButton, CYLPlusButtonSubclassing {
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.titleLabel?.textAlignment = .center
        self.adjustsImageWhenHighlighted = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:CYLPlusButtonSubclassing
    class func plusButton() -> Any {
        
        let buttonImage = UIImage(named: "post_normal")
        
        let button =  CYLPlusButtonSubclass()
        button.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleTopMargin]
        button.setImage(buttonImage, for: .normal)
        button.frame = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat((buttonImage?.size.width)!), height: CGFloat((buttonImage?.size.height)!))
        button.addTarget(button, action: #selector(clickPublish(_:)), for: .touchUpInside)
        return button
    }
    
    func clickPublish(_ sender : Any) {
        
        print("按钮点击")
        
        let tabBarController : CYLTabBarController = self.cyl_tabBarController
        let viewController : UIViewController = tabBarController.selectedViewController!
        
        
        let actionSheet = UIActionSheet()
        actionSheet.title = "选择操作"
        actionSheet.addButton(withTitle: "取消")
        actionSheet.addButton(withTitle: "第一个")
        actionSheet.addButton(withTitle: "第二个")
        actionSheet.cancelButtonIndex = 0
        
        actionSheet.show(in: viewController.view)
    }
    
//    static func plusChildViewController() -> UIViewController! {
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = UIColor.red
//        return viewController
//    }
    
//    static func indexOfPlusButtonInTabBar() -> UInt {
//        return 2
//    }
    
    static func multiplier(ofTabBarHeight tabBarHeight: CGFloat) -> CGFloat {
        return 0.3
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
