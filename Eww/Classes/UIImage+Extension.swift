//
//  UIImage+Extension.swift
//  AlphaTrion
//
//  Created by Joey on 28/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImageURL(_ string: String, placeholder: Image?, completionHandler: CompletionHandler? = nil) {
        let resource = URL(string: string)
        kf.setImage(with: resource, placeholder: placeholder, options: nil, progressBlock: nil, completionHandler: completionHandler)
    }
}

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
