//
//  Int+Extension.swift
//  AlphaTrion
//
//  Created by Joey on 10/04/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

extension Int {
    func displayCurrency() -> Float {
        return Float(self / 100)
    }
    
    func backendCurrency() -> Int {
        return self * 100
    }
}
