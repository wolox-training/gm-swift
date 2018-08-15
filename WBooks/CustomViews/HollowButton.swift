//
//  HollowButton.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 15/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

class HollowButton: UIButton {
    
    private static let defaultBlue = UIColor(hex: "#00A5E9")!
    private static let defaultRadius: CGFloat = 18.0
    private static let defaultFontSize: CGFloat = 18
    private static let defaultBorderWidth: CGFloat = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}

private extension HollowButton {
    
    func setupView() {
        setTextStyle()
        setBackgroundStyle()
    }
    
    
    func setTextStyle() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: HollowButton.defaultFontSize)
        setTitleColor(HollowButton.defaultBlue, for: .normal)
    }
    
    func setBackgroundStyle() {
        layer.borderWidth = HollowButton.defaultBorderWidth
        layer.cornerRadius = HollowButton.defaultRadius
        layer.borderColor = HollowButton.defaultBlue.cgColor
        layer.backgroundColor = UIColor.white.cgColor
    }
    
}
