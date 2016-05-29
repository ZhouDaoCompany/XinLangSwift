//
//  MainViewController.swift
//  XinLang
//
//  Created by cqz on 16/5/26.
//  Copyright © 2016年 cqz. All rights reserved.
//

import UIKit
import QorumLogs

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // iOS7以后只需要设置tintColor, 那么图片和文字都会按照tintColor渲染
        tabBar.tintColor = UIColor.orangeColor()
        
        addChildViewControllers()
        
        QL2("mylog")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.addSubview(composeButton)
        
        let rect = composeButton.frame
        
        let width = tabBar.bounds.width / CGFloat(childViewControllers.count)
        composeButton.frame = CGRect(x: 2 * width, y: 0, width: width, height: rect.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - 添加所有子控制器
    private func addChildViewControllers()
    {
        guard let filePath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
            else
        {
            NJLog("JSON文件不存在")
            return
        }
        
        guard let data = NSData(contentsOfFile: filePath) else{
            NJLog("加载二进制数据失败")
            return
        }
        
        do
        {
            let objc = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! [[String: AnyObject]]
            
            NJLog(objc)
            for dict in objc
            {
                let title = dict["title"] as? String
                let vcName = dict["vcName"] as? String
                let imageName = dict["imageName"] as? String
                addChildViewController(vcName, title: title, imageName: imageName)
            }
            
        }catch
        {
            // 只要try对应的方法发生了异常, 就会执行catch{}中的代码
            addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
            addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
            addChildViewController("NullViewController", title: "", imageName: "")
            addChildViewController("DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
            addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
        }
        

    }
    
    
    private func addChildViewController(childControllerName: String?, title: String?, imageName: String?)
    {
        // 1.动态获取命名空间
        guard let name = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else
        {
            NJLog(" 获取命名空间错误")
            return
        }
        
        var cls: AnyClass? = nil
        if let vcName = childControllerName {
            cls = NSClassFromString(name + "." + vcName)
        }
        
        guard let typeCls = cls as? UITableViewController.Type else
        {
            NJLog("cls不能当做UITableViewController")
            return
        }
        
        let childController = typeCls.init()
        
        
        childController.title  = title
    
        if let ivName = imageName
        {
            childController.tabBarItem.image = UIImage(named: ivName)
            childController.tabBarItem.selectedImage = UIImage(named: ivName + "_highlighted")
        }
        
        let nav = UINavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
    
    @objc private func compseBtnClick(btn: UIButton)
    {
        NJLog(btn)
    }
    
    // MARK: - 懒加载
    private lazy var composeButton: UIButton = {
        () -> UIButton
        in
        
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        btn.addTarget(self, action: #selector(MainViewController.compseBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn.sizeToFit()
    
        return btn
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
