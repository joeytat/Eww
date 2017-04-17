//
//  UIView+Extension.swift
//  AlphaTrion
//
//  Created by Joey on 27/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
            layer.shadowColor = UIColor.white.withAlphaComponent(0.6).cgColor
            layer.shadowRadius = 1
            layer.shadowOpacity = 0.3
        }
        get {
            return layer.shadowOffset
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
            layer.borderWidth = 0.5
        }
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
    }
}

extension UIView{
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
}


protocol UIViewLoading {}
extension UIView : UIViewLoading {}
extension UIViewLoading where Self : UIView {
    static func loadFromNib() -> Self {
        let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}
