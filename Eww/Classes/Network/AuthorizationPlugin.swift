//
//  AuthorizationPlugin.swift
//  Eww
//
//  Created by Joey on 07/03/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import Moya
import Result
import Hero

fileprivate let TokenExpiredCode = 401

public final class AuthorizationPlugin: PluginType {
    
    public init() {}
    
    public func willSend(_ request: RequestType, target: TargetType) {
        
    }
    
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        if let value = result.value {
            if value.statusCode == TokenExpiredCode {
                Keychain.delete(key: "token")
                let signIn = UIStoryboard(name: "SignIn", bundle: nil).instantiateInitialViewController()!
                Hero.shared.setDefaultAnimationForNextTransition(.pull(direction: .down))
                // TODO: - Should replace view controller instead
                UIApplication.shared.keyWindow?.rootViewController?.present(signIn, animated: true, completion: nil)
            }
        } else {
            guard let error = result.error else { return }
            UIApplication.shared.keyWindow?.rootViewController?.showMessage(message: error.localizedDescription, type: .error)
        }
    }
}
