//
//  HomeModel.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeModel: NSObject {
    
    var id: String = ""
    var title: String = ""
    var pic: String = ""
    var content: String = ""
    
//    override func setValue(_ value: Any?, forKey key: String) {
//        
//        if key == "id" {
//            self.id = "\(value)"
//        }
//        if key == "title" {
//            self.title = "\(value)"
//        }
//        
////        print("key:\(key)   value:\(value)")
//    }

    init(json : JSON) {
        
        super.init()
        
        self.id = json["id"].string!
        self.title = json["title"].string!
        self.pic = json["pic"].string!
        self.content = json["content"].string!

    }
    

}
