
//
//  Optional+Extension.swift
//  Cybertron
//
//  Created by Joey on 23/08/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == String {
    public var orEmpty: String {
        get {
            guard let str = self else { return "" }
            return str
        }
    }
}

public extension Optional where Wrapped == Int {
    public var orZero: Int {
        get {
            guard let num = self else { return 0 }
            return num
        }
    }
}

public extension Optional where Wrapped == Double {
    var orZero: Double {
        get {
            guard let num = self else { return 0.0 }
            return num
        }
    }
}
