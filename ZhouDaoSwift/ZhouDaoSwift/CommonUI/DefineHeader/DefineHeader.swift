//
//  DefineHeader.swift
//  SwiftControls
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 cqz. All rights reserved.
//

import Foundation
import UIKit

// Mark: - 屏幕宽高
let ScreenWidth  : CGFloat = UIScreen.main.bounds.size.width
let ScreenHeight : CGFloat = UIScreen.main.bounds.size.height

// MARK: - 颜色
func RGBA (r:CGFloat,_ g:CGFloat, _ b:CGFloat,_ a:CGFloat) -> UIColor {
    
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RandomColor() -> UIColor {
    let r = CGFloat((arc4random()%256))/255.0
    let g = CGFloat(arc4random()%256)/255.0
    let b = CGFloat(arc4random()%256)/255.0

    return UIColor(red: r, green: g, blue: b, alpha: 1)
}
func RGB (r:CGFloat,_ g:CGFloat, _ b:CGFloat) -> UIColor {
    
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

// MARK: - AppDelagate
let App_Delagate = UIApplication.shared.delegate as! AppDelegate
func LightStatusBar() {
    UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
}
func BlackStatusBar() {
    UIApplication.shared.setStatusBarStyle(.default, animated: true)
}

//MARK - UIView
func ViewWidth (view: UIView) -> CGFloat{
    
    return view.frame.size.width
}
func ViewHeight (view: UIView) -> CGFloat{
    
    return view.frame.size.height
}
/// 获取系统版本号
let kSystemVersion = Float(UIDevice.current.systemVersion);

//MARK: - 延时操作
func GCD_Delay(seconds: Double, completion: @escaping () -> Void) {

    let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute:completion)
}
//MARK - 字体
func FONT (size : CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}
