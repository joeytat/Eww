//
//  UIDate+Extension.swift
//  AlphaTrion
//
//  Created by Joey on 22/03/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

extension TimeInterval {
    func formatedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy 年 MM 月 dd 日 HH:mm"
        return dateFormatter.string(from: Date(timeIntervalSince1970: self))
    }
}
