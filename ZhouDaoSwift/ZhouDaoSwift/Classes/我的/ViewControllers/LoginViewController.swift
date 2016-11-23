//
//  LoginViewController.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/11/23.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    //MARK: Methods
    func initUI() -> Void {
        
        self.setupNaviBarWithTitle(title: "登录")
        self.setupNaviBarWithBtn(btnTag: NaviBarBtn.NaviRightBtn, title: "", imgName: "Count_close_normal_")
    }
    
    override func rightBtnAction() {
        
        self.navigationController?.dismiss(animated: true, completion: {
        })
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
