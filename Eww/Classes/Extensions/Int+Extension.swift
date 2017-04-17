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
