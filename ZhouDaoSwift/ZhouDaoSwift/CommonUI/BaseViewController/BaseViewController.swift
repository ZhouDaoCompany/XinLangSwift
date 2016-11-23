//
//  BaseViewController.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/11/23.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit


enum NaviBarBtn: Int {
    
    case NaviLeftBtn = 2001
    case NaviRightBtn = 2002
}

class BaseViewController: UIViewController {
    
    let kDefaultWidth: CGFloat = 44

    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: methods
    
    func setupNaviBarWithTitle(title : String) {
        
        self.title = title
    }
    func setupNaviBarWithBtn(btnTag : NaviBarBtn, title: String, imgName: String) {
    
        if btnTag == NaviBarBtn.NaviRightBtn {
            
            let rightButton = self.rightBtn
            rightButton.setImage(UIImage.init(named: imgName), for: .normal)
            let rightButtonItem = UIBarButtonItem.init(customView: rightButton)
            self.navigationItem.rightBarButtonItem = rightButtonItem
        } else {
            
            let leftButton = self.leftBtn
            leftButton.setImage(UIImage.init(named: imgName), for: .normal)
            let rightButtonItem = UIBarButtonItem.init(customView: leftButton)
            self.navigationItem.leftBarButtonItem = rightButtonItem
        }
    }
    
    func handleBtnAction(button: UIButton) {
        
        if button.tag == 2001 {
            
            rightBtnAction()
        } else {
            
            leftBtnAction()
        }
    }
    
    func leftBtnAction() {
        
        self.navigationController!.popViewController(animated: true)
    }
    func rightBtnAction() {
        
    }
    
    //MARK: setters and getters
    private var rightBtn: UIButton {
        
        let frame = CGRect(x: CGFloat(0.0), y: CGFloat(20), width: kDefaultWidth, height: kDefaultWidth)
        let rightButton = UIButton(type: .custom)
        rightButton.frame = frame
        rightButton.tag = 2001
        rightButton.backgroundColor = UIColor.clear
        rightButton.addTarget(self, action: #selector(handleBtnAction(button:)), for: .touchUpInside)
        return rightButton
    }
    
    private var leftBtn: UIButton {
        
        let frame = CGRect(x: ScreenWidth - kDefaultWidth, y: CGFloat(20), width: kDefaultWidth, height: kDefaultWidth)
        let leftBtn = UIButton(type: .custom)
        leftBtn.frame = frame
        leftBtn.tag = 2002
        leftBtn.backgroundColor = UIColor.clear
        leftBtn.addTarget(self, action: #selector(handleBtnAction(button:)), for: .touchUpInside)
        return leftBtn
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
