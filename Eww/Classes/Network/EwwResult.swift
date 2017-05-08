//
//  Result.swift
//  Eww
//
//  Created by Joey on 21/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

public enum EwwResult<T> {
    case success(T)
    case failed(String)
}

public extension EwwResult {
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
