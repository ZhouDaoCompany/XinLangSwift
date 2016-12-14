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
        
        let testString = "hdhcgbdjcbehuvchwcedqbjbfucegryubwxwnkwqc"
        var testDictionary = Dictionary<Character, Int>()
        var testDict = Dictionary<String, Any>()
        

        
        var imgArrays : [String] = []
        var arr = Array<Any>()
        
        
        if testDict["imagesUrl"] != nil {
            
            var imgUrls  = (testDict["imagesUrl"] as! [Any])
            
            if !imgUrls.isEmpty {
                
            }

        }
        
        
        
        testString.characters.forEach { (Character) in
            let num = testDictionary[Character]
            if num == nil {
                testDictionary[Character] = 1
            } else {
                testDictionary[Character] = num! + 1
            }
        }
        
        var maxCount = 0
        testDictionary.forEach { (key: Character, value: Int) in
    
            if maxCount < value {
                
                maxCount = value
            }
        }
        print("最大数是\(maxCount)")
        testDictionary.forEach { (key: Character, value: Int) in
            
            if value == maxCount {
                
                print("最大的字符是\(key)")
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

