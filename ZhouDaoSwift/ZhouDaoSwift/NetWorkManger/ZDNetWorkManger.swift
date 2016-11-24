//
//  ZDNetWorkManger.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/11/24.
//  Copyright © 2016年 CQZ. All rights reserved.
//


import UIKit
import Foundation
import Alamofire
import SwiftyJSON


typealias ZDResponseSuccess = (_ response: Any) ->Void
typealias ZDResponseFail    =  (_ error: Error) ->Void

class ZDNetWorkManger: NSObject {
    
    /**
     *   get方式获取数据
     *   url : 请求地址
     *   params : 传入参数
     *   success : 请求成功回调函数
     *   fail : 请求失败回调函数
     */
    
    static func getWithUrl(_ url: String, params: [String : Any], success: @escaping ZDResponseSuccess, fail: @escaping ZDResponseFail) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let getUrl = BASE_URL + url
        Alamofire.request(getUrl, method: .get, parameters: params, encoding: URLEncoding.default, headers: [:]).responseJSON { (response) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch response.result {
                
            case .success(let value):
                
                let json = JSON(value)
                print("get请求成功: \(json)")
                success(json)
                break
                
            case .failure(let error):
                
                print("请求失败: \(error)")
                fail(error)
                break
            }
        }
    }
    
    /**
     *   post方式获取数据
     *   url : 请求地址
     *   params : 传入参数
     *   success : 请求成功回调函数
     *   fail : 请求失败回调函数
     */

    static func postWithUrl(_ url: String, params: [String : Any], success: @escaping ZDResponseSuccess, fail: @escaping ZDResponseFail) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let postUrl = BASE_URL + url
        Alamofire.request(postUrl, method: .post, parameters: params, encoding: URLEncoding.default, headers: [:]).responseJSON { (response) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch response.result {
                
            case .success(let value):
                
                let json = JSON(value)
                print("post请求成功: \(json)")

                success(json)
                break
                
            case .failure(let error):
                
                fail(error)
                print("post提交失败: \(error)")
                break
            }
            
        }
    }
    
    
    
    

}
