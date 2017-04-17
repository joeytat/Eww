//
//  UIWindow+Extension.swift
//  Eww
//
//  Created by Joey on 27/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit

public extension UIScreen {
    @nonobjc public  class var width: CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }
    @nonobjc public class var height: CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
}
