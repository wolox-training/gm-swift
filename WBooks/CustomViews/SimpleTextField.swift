//
//  SimpleTextField.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 21/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class SimpleTextField: UITextField {
    
    private static let fontSize: CGFloat = 19
    private static let lineColor = UIColor.lightGray
    
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
        font = UIFont.systemFont(ofSize: SimpleTextField.fontSize)
        borderStyle = UITextBorderStyle.none
        backgroundColor = UIColor.clear
        setBottomBorder()
    }
    
    func setBottomBorder() {
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.masksToBounds = false
        layer.shadowColor = SimpleTextField.lineColor.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
}

extension SimpleTextField {
    
    func setPlaceholder(text: String) {
        let attributes = [
            NSAttributedStringKey.font : UIFont.italicSystemFont(ofSize: SimpleTextField.fontSize)
        ]
        
        attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
    }
    
}
