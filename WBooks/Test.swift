//
//  Test.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 14/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

// Signal, SignalProducer, MutableProperty, Property, Actions

class Foo {
    
    private let name = MutableProperty<String?>(.none)
    let lastName = Property<Int>(value: 1)
    // let bar = Property<Int>(value: 1, then: producer)
    // let bar = Property<Int>(name)
    
    func foo() {
        name.value = ""
        
        name.producer.startWithValues { myString in print(myString) }
        name.producer.startWithFailed { error in print(error) }
        
        name.signal
            .skipNil()
            .map { $0.isEmpty }
            .observeValues { myString in print(myString) }
    }
}
