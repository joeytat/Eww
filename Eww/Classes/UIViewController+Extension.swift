//
//  UIViewController+Extension.swift
//  AlphaTrion
//
//  Created by Joey on 15/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import Whisper

enum MessageType {
    case error, success
}

extension UIViewController {
    func startActivity() {
        let activityData = ActivityData(type: NVActivityIndicatorType.ballPulse, displayTimeThreshold: 200, minimumDisplayTime: 200)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func stopActivity() {
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }
    
    func showMessage(message: String, type: MessageType) {
        let murmur = Murmur(title: message)
        Whisper.show(whistle: murmur, action: .show(2))
    }
    
    func insertWindowSnaphot() {
        let snapshot = UIApplication.shared.keyWindow?.snapshotView(afterScreenUpdates: false)
        view.insertSubview(snapshot!, at: 0)
    }
}

extension UIWindow {
    var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    static func getVisibleViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
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
