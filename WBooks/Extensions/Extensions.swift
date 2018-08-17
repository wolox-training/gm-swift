//
//  Extensions.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 15/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import WolmoCore
import Result

/*
public extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
*/


public extension UIImageView {
    func load(url: URL) {
        
        let signalProducer = ImageFetcher().fetchImage(url).producer.flatMapError {
            _ in SignalProducer<UIImage, NoError>.empty
        }
        
        signalProducer.startWithValues { [unowned self] loadedImage in
            self.image = loadedImage
        }
    }
}
