//
//  ExternalView.swift
//  TableViewAutoHeight
//
//  Created by 龚浩 on 16/11/21.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

@IBDesignable
class ExternalView: UIView {

    @IBInspectable
    var cornerRadius:CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }

}
