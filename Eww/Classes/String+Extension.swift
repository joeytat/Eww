//
//  String+Extension.swift
//  AlphaTrion
//
//  Created by Joey on 07/03/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits
        
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) != nil
    }
    
    func phonetic() -> String {
        let mutableString = NSMutableString(string: self)
        // Convert to phonetic
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        // Strip pitch
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        
        return mutableString.capitalized
    }
    
    func plateFormat() -> (province: String, number: String) {
        if self.characters.count > 2 {
            let location = substring(to: index(startIndex, offsetBy: 2))
            
            let numberIndex = index(endIndex, offsetBy: -(characters.count - 2))
            let number = substring(from: numberIndex)
            
            return (province: location, number: number)
        } else {
            return (province: "车牌", number: "数据错误")
        }
    }
    
    func height(font: UIFont) -> CGFloat {
        let string = NSString(string: self)
        return string.size(attributes: [NSFontAttributeName : font]).height
    }
    
    func width(font: UIFont) -> CGFloat {
        let string = NSString(string: self)
        return string.size(attributes: [NSFontAttributeName : font]).width
    }
}
