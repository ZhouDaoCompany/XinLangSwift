//
//  ZDLTabBarControllerConfig.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

class ZDLTabBarControllerConfig: NSObject {
    
    var tabBarController : CYLTabBarController!
    
    
    
    //Mark: 视图控制器数组
    func viewControllers() -> NSArray {
        
        let homevc = HomeViewController()
        let firstNav  = UINavigationController(rootViewController: homevc)
        
        let recomVC = RecomViewController()
        let secNav  = UINavigationController(rootViewController: recomVC)
        
        
        let toolVC = ToolsViewController()
        let thirdNav  = UINavigationController(rootViewController: toolVC)
        
        let meVC  = MeViewController()
        let fourNav  = UINavigationController(rootViewController: meVC)
        
        let arr = [firstNav,secNav ,thirdNav,fourNav]
        return arr as NSArray
    }
    

}
