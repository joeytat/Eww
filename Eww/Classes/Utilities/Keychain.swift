//
//  Keychain.swift
//  Eww
//
//  Created by Joey on 15/02/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import KeychainAccess

fileprivate let kKeychianService: String = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String

public struct Keychain {
    public static func delete(key: String) {
        let keychain = KeychainAccess.Keychain(service: kKeychianService)
        keychain[key] = nil
    }
    
    public static func save(key: String, value: String) {
        let keychain = KeychainAccess.Keychain(service: kKeychianService)
        keychain[key] = value
    }
    
    public static func load(key: String) -> String? {
        let keychain = KeychainAccess.Keychain(service: kKeychianService)
        return keychain[key]
    }
}
