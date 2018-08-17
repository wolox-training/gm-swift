//
//  RoundedImageView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 16/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        setupView()
    }
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}

private extension RoundedImageView {
    
    func setupView() {
        layer.cornerRadius = 25;
        layer.masksToBounds = true;
    }
    
}
