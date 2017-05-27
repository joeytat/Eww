//
//  UIViewController+Extension.swift
//  Eww
//
//  Created by Joey on 15/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit
import Whisper

public enum MessageType {
    case error, success
}

public extension UIViewController {
    public func showMessage(message: String,
                            type: MessageType,
                            errorColor: UIColor = UIColor(hue:0.01, saturation:0.80, brightness:1.00, alpha:1.00),
                            successColor: UIColor = UIColor(hue:0.28, saturation:0.59, brightness:0.71, alpha:1.00)
        ) {
        let backgroundColor = (type == .error) ? errorColor : successColor
        let murmur = Murmur(title: message, backgroundColor: backgroundColor, titleColor: UIColor.white, font: UIFont.systemFont(ofSize: 12), action: nil)
        Whisper.show(whistle: murmur, action: .show(2))
    }
    
    public func insertWindowSnaphot() {
        let snapshot = UIApplication.shared.keyWindow?.snapshotView(afterScreenUpdates: false)
        view.insertSubview(snapshot!, at: 0)
    }
}

public extension UIWindow {
    public var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    public static func getVisibleViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(pvc)
            } else {
                return vc
            }
        }
    }
}
