//
//  SimpleTextField.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 21/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

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
        font = UIFont.systemFont(ofSize: 19)
        borderStyle = UITextBorderStyle.none
        backgroundColor = UIColor.clear
        setBottomBorder()
    }
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension SimpleTextField {
    
    func setPlaceholder(text: String) {
        let attributes = [
            NSAttributedStringKey.font : UIFont.italicSystemFont(ofSize: 19)
        ]
        
        attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
    }
    
}
