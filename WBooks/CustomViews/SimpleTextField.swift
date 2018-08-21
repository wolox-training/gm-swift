//
//  SimpleTextField.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 21/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

class SimpleTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}

private extension SimpleTextField {
    
    func setupView() {
        font = UIFont(name: font!.fontName, size: 19)
        //borderStyle = UITextBorderStyle.none
        //backgroundColor = UIColor.clear
        underlined()
    }
    
    func underlined(){
        let border = CALayer()
        let lineWidth = CGFloat(0.3)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - lineWidth, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = lineWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
