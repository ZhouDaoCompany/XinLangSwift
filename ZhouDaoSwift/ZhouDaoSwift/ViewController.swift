//
//  ViewController.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/10/26.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        creatTabbarUI()
    }
    //MARK: 布局tabbar
    func creatTabbarUI() {
        
        let testString = "hhjsbcjajhcsavchjaaaaasvxhsafdubac"
        var testDictionary : [Character : Int] = [:]
        
        for ch in testString.characters {
            
            let num = testDictionary[ch]
            
            if num == nil {
                
                testDictionary[ch] = 1
            } else {
                
                testDictionary[ch] = num! + 1
            }
        }
        
        var maxCount = 0
        for count in testDictionary.values {
            
            if maxCount < count {
                
                maxCount = count
            }
        }
        
        for (ch , num) in testDictionary {
            
            if maxCount == num {
                
                let alertController = UIAlertController(title: "答案", message: "数量最多的字符是: \(ch)", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                    
                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: {
                    
                })
                
            }
        }
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

