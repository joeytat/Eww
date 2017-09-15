//
//  String+Extension.swift
//  Eww
//
//  Created by Joey on 07/03/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    
    public func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits
        
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) != nil
    }
    
    public func phonetic() -> String {
        let mutableString = NSMutableString(string: self)
        // Convert to phonetic
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        // Strip pitch
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        
        return mutableString.capitalized
    }
    
    public func plateFormat() -> (province: String, number: String) {
        if self.characters.count > 2 {
            let location = substring(to: index(startIndex, offsetBy: 2))
            
            let numberIndex = index(endIndex, offsetBy: -(characters.count - 2))
            let number = substring(from: numberIndex)
            
            return (province: location, number: number)
        } else {
            return (province: "车牌", number: "数据错误")
        }
    }
    
    public func height(font: UIFont) -> CGFloat {
        let string = NSString(string: self)
        return string.size(attributes: [NSFontAttributeName : font]).height
    }
    
    public func width(font: UIFont) -> CGFloat {
        let string = NSString(string: self)
        return string.size(attributes: [NSFontAttributeName : font]).width
    }
    
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}


// MARK: - Convert

public extension String {
    public func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: self)
    }
    
    public func toFloat() -> Float {
        guard let value = Float(self) else { return 0.0 }
        return value
    }
    
    public func toDouble(places: Int = 2) -> Double? {
        guard let double = Double(self) else { return nil }
        let formattedStr = String(format: "%.\(places)f", double)
        guard let value = Double(formattedStr) else { return nil }
        return value
    }
    
    
    public subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.characters.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.characters.index(self.startIndex, offsetBy: r.upperBound)
            
            return self[Range(startIndex..<endIndex)]
        }
    }
    
    public func countingTitle(for forValue: String?) -> String {
        if let value = forValue, !value.isEmpty {
            return "\(self)<red>( \(value.characters.count) 位)</red>"
        } else {
            return self
        }
    }
    
    public func last(count: Int) -> String {
        let index = self.index(self.endIndex, offsetBy: -count)
        return substring(from: index)
    }
    
    public func first(count: Int) -> String {
        let index = self.index(self.endIndex, offsetBy: count)
        return substring(to: index)
    }
}


// MARK: - Validataion

public extension String {
    
    public func matches(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    public func isPhoneNumber(strict: Bool = false) -> Bool {
        // TODO: - 补全严格校验
        let match = matches(for: "^(13[0-9]|14[579]|15[0-3,5-9]|17[0135678]|18[0-9])\\d{0,8}$")
        return match.count > 0
    }
    
    public func isIdCard() -> Bool {
        return self.matches(for: "^([1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X))$").count > 0
    }
    
    public func isBankId() -> Bool {
        return self.matches(for: "^(\\d{16}|\\d{17}|\\d{18}|\\d{19})$").count > 0
    }
}
