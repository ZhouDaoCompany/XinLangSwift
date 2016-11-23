//
//  MeViewController.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

class MeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    //MARK: Methods
    func initUI() -> Void {
        
        self.setupNaviBarWithTitle(title: "我的")
    }
    
    //MARK: setters and getters

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
