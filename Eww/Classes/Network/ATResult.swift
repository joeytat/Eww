//
//  Result.swift
//  Eww
//
//  Created by Joey on 21/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

public enum ATResult<T> {
    case success(T)
    case failed(String)
}

public extension ATResult {
    public var isValid: Bool {
        get{
            switch self {
            case .failed(_):
                return false
            default:
                return true
            }
        }
    }
    
}
