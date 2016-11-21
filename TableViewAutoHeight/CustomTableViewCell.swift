//
//  CustomTableViewCell.swift
//  TableViewCollectionViewAutoHeight
//
//  Created by 龚浩 on 16/11/21.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
