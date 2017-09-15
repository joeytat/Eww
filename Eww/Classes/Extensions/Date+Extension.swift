//
//  UIDate+Extension.swift
//  Eww
//
//  Created by Joey on 22/03/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

public extension TimeInterval {
    public func formatedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy 年 MM 月 dd 日 HH:mm"
        return dateFormatter.string(from: Date(timeIntervalSince1970: self))
    }
}


public extension Date {
    public static var formattedNow: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return dateFormatter.string(from: Date())
        }
    }
    
    public var simplifyString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: self)
        }
    }
    
    public var beginOfTheDay: Date {
        get {
            let simpleStr = simplifyString
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.date(from: simpleStr)!
        }
    }
    
    public var endOfTheDay: Date {
        get {
            let hours = Calendar.current.date(byAdding: .hour, value: 23, to: beginOfTheDay)!
            return Calendar.current.date(byAdding: .minute, value: 59, to: hours)!
        }
    }
}


