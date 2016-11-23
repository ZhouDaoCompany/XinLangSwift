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
        
        let tabBarController = CYLTabBarController(viewControllers: self.viewControllers() as! [UIViewController], tabBarItemsAttributes: self.tabBarItemsAttributesForController())
        self.customizeTabBarAppearance(tabBarController: tabBarController!)
        return tabBarController
    }
    

    //Mark: 视图控制器数组
    func viewControllers() ->  [Any] {
        
        let homevc = HomeViewController()
        let firstNav  = CYLBaseNavigationController(rootViewController: homevc)
        
        let recomVC = RecomViewController()
        let secNav  = CYLBaseNavigationController(rootViewController: recomVC)
        
        let toolVC = ToolsViewController()
        let thirdNav  = CYLBaseNavigationController(rootViewController: toolVC)
        
        let meVC  = MeViewController()
        let fourNav  = CYLBaseNavigationController(rootViewController: meVC)
        
        let viewControllers = [firstNav, secNav, thirdNav, fourNav]
        return viewControllers
    }
    
    //MARK: tabBarItemsAttributesForController
    func tabBarItemsAttributesForController() -> [[AnyHashable : Any]]! {
        let firstTabBarItemsAttributes = [CYLTabBarItemTitle: "首页", CYLTabBarItemImage: "homeUnselect", CYLTabBarItemSelectedImage: "homeSelect"]
        let secondTabBarItemsAttributes = [CYLTabBarItemTitle: "推荐", CYLTabBarItemImage: "recommentUnSelect", CYLTabBarItemSelectedImage: "recommentSelect"]
        let thirdTabBarItemsAttributes = [CYLTabBarItemTitle: "工具", CYLTabBarItemImage: "ToolsUnSelect", CYLTabBarItemSelectedImage: "ToolsSelect"]
        let fourthTabBarItemsAttributes = [CYLTabBarItemTitle: "我的", CYLTabBarItemImage: "mineUnSelect", CYLTabBarItemSelectedImage: "mineSelect"]
        let tabBarItemsAttributes = [firstTabBarItemsAttributes, secondTabBarItemsAttributes, thirdTabBarItemsAttributes, fourthTabBarItemsAttributes]
        return tabBarItemsAttributes
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
        tab.backgroundColor = UIColor.white
        tab.shadowImage = UIImage(named: "tapbar_top_line")
    }
    
}



