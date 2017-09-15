//
//  Dictionary+Extension.swift
//  Cybertron
//
//  Created by Joey on 12/06/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

public func +<Key, Value>(lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
    var result = lhs
    rhs.forEach { result[$0] = $1 }
    return result
}
