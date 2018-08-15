//
//  GradientButton.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 15/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

class GradientButton: UIButton {
    
    private static let defaultLeftColor = UIColor(hex: "#00A5E9")! // Blue
    private static let defaultRightColor = UIColor(hex: "#3EBEBF")! // Green
    private static let defaultRadius: CGFloat = 18.0
    private static let defaultFontSize: CGFloat = 18
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}

private extension GradientButton {
    
    func setupView() {
        setTextStyle()
        setGradient(leftColor: GradientButton.defaultLeftColor, rightColor: GradientButton.defaultRightColor)
    }
    
    
    func setTextStyle() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: GradientButton.defaultFontSize)
        setTitleColor(UIColor.white, for: .normal)
    }
    
    func setGradient(leftColor: UIColor, rightColor: UIColor) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [leftColor.cgColor, rightColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0,y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0,y: 0.5)
        gradient.cornerRadius = GradientButton.defaultRadius
        layer.insertSublayer(gradient, at: 0)
    }
    
}
