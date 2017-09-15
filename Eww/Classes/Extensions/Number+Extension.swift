//
//  Int+Extension.swift
//  Eww
//
//  Created by Joey on 10/04/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

public extension Int {
    public func displayCurrency() -> Float {
        return Float(self / 100)
    }
    
    public func backendCurrency() -> Int {
        return self * 100
    }
}

public extension Float {
    public var priceFormat: String {
        return String(format: "¥ %.2f", self)
    }
    
    public func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}



public extension Double {
    public func format(_ f: Double) -> String {
        return String(format: "%\(f)f", self)
    }
    
    public func autoFormat() -> String {
        let ceilDouble = ceil(self)
        if ceilDouble == self {
            return self.format(0)
        }
        
        return self.format(0.2)
    }
}
