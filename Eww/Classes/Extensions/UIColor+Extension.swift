//
//  Color.swift
//  Eww
//
//  Created by Joey on 15/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit

public enum Color {
    case primary
    case darkPrimary
    case accentOrange
    case accentBlue
    case textTitle
    case textHead
    case textBody
    case textLight
    case white
    case black
    case background
}

public extension UIColor {
    public var disable: UIColor {
        return self.withAlphaComponent(0.7)
    }
}
