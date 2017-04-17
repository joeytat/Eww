//
//  UIWindow+Extension.swift
//  AlphaTrion
//
//  Created by Joey on 27/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    @nonobjc class var width: CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }
    @nonobjc class var height: CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
}
