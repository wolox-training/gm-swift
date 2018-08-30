//
//  SimpleTextView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 30/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class SimpleTextView: UITextView {
    
    public static let defaultPlaceholder = "Write your comment here..."
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}


// MARK: - Private
private extension SimpleTextView {
    
    func setupView() {
        allowsEditingTextAttributes = true
        textContainerInset = UIEdgeInsetsMake(14, 10, 14, 10)
        
        setPlaceholder(text: SimpleTextView.defaultPlaceholder)
        textColor = UIColor.lightGray
        
        layer.cornerRadius = 2
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

extension SimpleTextView {
    
    func setText(text: String) {
        print(">> setText")
        let fontSize = font!.pointSize
        let attributes = [NSAttributedStringKey: Any]()
        
        attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    func setPlaceholder(text: String) {
        print(">> setPlaceholder")
        let fontSize = font!.pointSize
        let attributes = [
            NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: fontSize)
        ]
        
        attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
}
