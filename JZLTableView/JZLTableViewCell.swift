//
//  JZLTableViewCell.swift
//  JZLTableView
//
//  Created by 蒋志礼 on 16/1/31.
//  Copyright © 2016年 蒋志礼. All rights reserved.
//

import UIKit

class JZLTableViewCell: UITableViewCell {
    @IBInspectable var selectedImgView:UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectedImgView = UIImageView(image: UIImage(named: "Unchecked_48"),
                                highlightedImage: UIImage(named: "Checked_48"))
        self.selectedImgView?.contentMode = .Center
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.selectedImgView?.highlighted = selected
        
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        for item in self.subviews {
            if item is UIControl {
               item.hidden = true
                if let itemImgView = self.selectedImgView {
                    itemImgView.center = item.center
                    self.insertSubview(itemImgView, atIndex: 0)
                }
            }
        }
    }
}
