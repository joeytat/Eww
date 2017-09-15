//
//  UIViewController+Extension.swift
//  Eww
//
//  Created by Joey on 15/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit
import SwiftyDrop


import SwiftyDrop

public enum MessageType: DropStatable {
    case success
    case error
    
    public var backgroundColor: UIColor? {
        switch self {
        case .success:
            return UIColor(hue:0.27, saturation:0.51, brightness:0.69, alpha:1.00)
        case .error:
            return UIColor(hue:0.99, saturation:0.66, brightness:1.00, alpha:1.00)
        }
    }
    public var font: UIFont? {
        return UIFont.systemFont(ofSize: 15)
    }
    public var textColor: UIColor? {
        return UIColor.white
    }
    public var blurEffect: UIBlurEffect? {
        return nil
    }
}

public extension UIViewController {
    public func showMessage(message: String, type: MessageType) {
        Drop.down(message, state: type)
    }
    
    public func insertWindowSnaphot() {
        let snapshot = UIApplication.shared.keyWindow?.snapshotView(afterScreenUpdates: false)
        view.insertSubview(snapshot!, at: 0)
    }
}
