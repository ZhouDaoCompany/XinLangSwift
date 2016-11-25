//
//  HomeViewCell.swift
//  ZhouDaoSwift
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 CQZ. All rights reserved.
//

import UIKit

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
        
        let url = NSURL(string: model.pic)
        self.headImgView?.sd_setImage(with: url as URL!, placeholderImage: UIImage(named: "home_palcehold"))
        self.titleLab.text = model.title
        self.contentLab.text = model.content

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
