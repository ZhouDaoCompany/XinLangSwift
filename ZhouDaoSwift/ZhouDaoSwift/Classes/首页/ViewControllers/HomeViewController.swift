//
//  HomeViewController.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

let CELLIDENTIFER = "HomeViewCellIDentifer"

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource,JSAnimatedImagesViewDataSource {
    
    var dataSourceArrays : [Any] = []
    var tableView : UITableView!
    var animatedImgiew : JSAnimatedImagesView!
    
    
 
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTheFigureAmplification()
        initUI()
    }
    // MARK: 启动图放大
    func startTheFigureAmplification() {
        
        let window = UIApplication.shared.keyWindow!
        animatedImgiew = JSAnimatedImagesView()
        animatedImgiew.frame = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: ScreenWidth, height: ScreenHeight)
        animatedImgiew.dataSource = self
        window.addSubview(self.animatedImgiew)
        
        GCD_Delay(seconds: 3.0, completion: { [weak self] in
            
            self?.animatedImgiew.removeFromSuperview()
        })
        
    }
    // MARK: Methods
    func initUI() -> Void {
        
        self.setupNaviBarWithTitle(title: "首页")
        
        let rect = CGRect(x: CGFloat(0.0), y: CGFloat(64.0), width: ScreenWidth, height: ScreenHeight - 114)
        tableView = UITableView(frame: rect, style: UITableViewStyle.plain)
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: CELLIDENTIFER)
        self.view.addSubview(tableView)

        loadData()
    }
    // MARK: 数据请求
    func loadData() -> Void {
        
        ZDNetWorkManger.getWithUrl("api_recom.php?key=16248ef5&c=indexAll", params: [:], success: { [weak self] (response) in
            
            let twoArrays = response["data"][1]["data"].array
            twoArrays?.forEach({ (dict) in
                
                let model = HomeModel.init(json : dict)
                self?.dataSourceArrays.append(model)
            })
            self?.tableView.reloadData()

        }) { (error) in }

    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSourceArrays.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : HomeViewCell = tableView.dequeueReusableCell(withIdentifier: CELLIDENTIFER) as! HomeViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if self.dataSourceArrays.count > 0 {
            
            let model = self.dataSourceArrays[indexPath.row] as! HomeModel
            cell.setUIHomeModel(model)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(95)
    }
    // MARK: JSAnimatedImagesViewDataSource
    func animatedImagesNumber(ofImages animatedImagesView: JSAnimatedImagesView!) -> UInt {
        
        return 2
    }
    func animatedImagesView(_ animatedImagesView: JSAnimatedImagesView!, imageAt index: UInt) -> UIImage! {
        
        let imageDictionary: Dictionary = ["320":"LaunchImage-700-568h","375":"LaunchImage-800-667h","414":"LaunchImage-800-Portrait-736h"]
        let keyString = String(format: "%.0f", ScreenWidth)
        var imgName = imageDictionary[keyString]
        if (imgName?.isEmpty)! {
            imgName = "LaunchImage-700"
        }
        return UIImage(named: imgName!)
    }
    
    //MARK: setters and getters
//    private var tableView: UITableView {
//        
//        let rect = CGRect(x: CGFloat(0.0), y: CGFloat(64.0), width: ScreenWidth, height: ScreenHeight - 114)
//        let tableView = UITableView(frame: rect, style: UITableViewStyle.grouped)
//        tableView.backgroundColor = UIColor.clear
//        tableView.tableFooterView = UIView(frame: CGRect.zero)
//        tableView.delegate = self
//        tableView.dataSource = self
//        return tableView
//    }

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
