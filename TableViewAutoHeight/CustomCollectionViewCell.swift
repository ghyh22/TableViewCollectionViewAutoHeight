//
//  CustomCollectionViewCell.swift
//  TableViewAutoHeight
//
//  Created by 龚浩 on 16/11/15.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var label: UILabel!
    
    var data:String{
        get{
            return label.text ?? ""
        }
        set{
            label.text = newValue
        }
    }
}
