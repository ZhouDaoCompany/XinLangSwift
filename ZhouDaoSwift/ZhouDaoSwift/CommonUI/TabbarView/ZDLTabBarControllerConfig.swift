//
//  ZDLTabBarControllerConfig.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit
import Foundation

class ZDLTabBarControllerConfig: NSObject {
    
    
    var tabBarController : CYLTabBarController! {
       guard var vcArrays = viewControllers() as [UIViewController!];
       guard var dictArrays = tabBarItemsAttributesForController() as [Dictionary!]
		
        let tabBarController = CYLTabBarController!.init(viewControllers: vcArrays, tabBarItemsAttributes: dictArrays)
//        customizeTabBarAppearance()
        return tabBarController
    }
    
    //Mark: 视图控制器数组
    func viewControllers() -> NSArray {
        
        let homevc = HomeViewController()
        let firstNav  = CYLBaseNavigationController(rootViewController: homevc)
        
        let recomVC = RecomViewController()
        let secNav  = CYLBaseNavigationController(rootViewController: recomVC)
        
        let toolVC = ToolsViewController()
        let thirdNav  = CYLBaseNavigationController(rootViewController: toolVC)
        
        let meVC  = MeViewController()
        let fourNav  = CYLBaseNavigationController(rootViewController: meVC)
        
        let arr = [firstNav,secNav ,thirdNav,fourNav]
        return arr as NSArray
    }
    
    //MARK: tabBarItemsAttributesForController
    func tabBarItemsAttributesForController() -> NSArray {
        
        let firstTabBarItemsAttributes : [String : String] = [CYLTabBarItemTitle : "首页",CYLTabBarItemImage : "homeUnselect",CYLTabBarItemSelectedImage : "homeSelect"]
        let secondTabBarItemsAttributes : [String : String] = [CYLTabBarItemTitle : "推荐",CYLTabBarItemImage : "recommentUnSelect",CYLTabBarItemSelectedImage : "recommentSelect"]
        let thirdTabBarItemsAttributes : [String : String] = [CYLTabBarItemTitle : "工具",CYLTabBarItemImage : "ToolsUnSelect",CYLTabBarItemSelectedImage : "ToolsSelect"]
        let fourthTabBarItemsAttributes : [String : String] = [CYLTabBarItemTitle : "我的",CYLTabBarItemImage : "mineUnSelect",CYLTabBarItemSelectedImage : "mineSelect"]
        
        let arr = [
            firstTabBarItemsAttributes,
            secondTabBarItemsAttributes,
            thirdTabBarItemsAttributes,
            fourthTabBarItemsAttributes
        ];
        return arr as NSArray
    }
    
    func customizeTabBarAppearance(tabBarController : CYLTabBarController) {
        
        var normalAttrs  = Dictionary<String, AnyObject>()
        normalAttrs[NSForegroundColorAttributeName] = UIColor.hexString(toColor: "666666")
        
        let selectedAttrs : [String : AnyObject] =  [NSForegroundColorAttributeName : UIColor.hexString(toColor: "00c8aa")]
        
        let tabBar = UITabBarItem.appearance()
        tabBar.titlePositionAdjustment = UIOffsetMake(0, -2);
        tabBar.setTitleTextAttributes(normalAttrs, for: UIControlState.normal)
        tabBar.setTitleTextAttributes(selectedAttrs, for: UIControlState.selected)
        
        let tab = UITabBar.appearance()
//        tab.backgroundImage = 
        tab.backgroundColor = UIColor.white
        tab.shadowImage = UIImage(named: "tapbar_top_line")
                
    }
    


}
