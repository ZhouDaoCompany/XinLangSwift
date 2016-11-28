//
//  HomeViewCell.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewCell: UITableViewCell {

    @IBOutlet weak var headImgView: UIImageView!
    @IBOutlet weak var contentLab: UILabel!
    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
    }
    func setUIHomeModel(_ model : HomeModel) {
        
        let url = URL(string: model.pic)!
        self.headImgView.kf.setImage(with: url,
                                              placeholder: UIImage(named: "home_palcehold"),
                                              options: [.transition(ImageTransition.fade(1))],
                                              progressBlock: { receivedSize, totalSize in
                                                
        },
                                              completionHandler: { image, error, cacheType, imageURL in
        })
        self.titleLab.text = model.title
        self.contentLab.text = model.content
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
