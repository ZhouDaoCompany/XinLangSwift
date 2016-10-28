//
//  CYLBaseNavigationController.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/10/28.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

class CYLBaseNavigationController: UINavigationController {

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //self.isNavigationBarHidden = true
        super.pushViewController(viewController, animated: animated)
        
        if self.viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
