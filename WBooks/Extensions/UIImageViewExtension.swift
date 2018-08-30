//
//  UIImageViewExtension.swift
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


public extension UIImageView {
    func load(url: URL) {
        
        let signalProducer = ImageFetcher().fetchImage(url).producer.flatMapError {
            _ in SignalProducer<UIImage, NoError>.empty
        }
        
        signalProducer.startWithValues { [weak self] loadedImage in
            self?.image = loadedImage
        }
    }
}
