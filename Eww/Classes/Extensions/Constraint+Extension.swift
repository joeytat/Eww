//
//  Constraint+Extension.swift
//  Tea
//
//  Created by Max on 01/05/2017.
//  Copyright © 2017 Miaomi. All rights reserved.
//

import Foundation
import UIKit

public extension NSLayoutConstraint {
    @IBInspectable public var usePixels: Bool {
        get {
            return false // default Value
        }
        set {
            if newValue {
                constant = constant / UIScreen.main.scale
            }
        }
    }
}
