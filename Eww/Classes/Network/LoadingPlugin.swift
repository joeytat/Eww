//
//  LoadingPlugin.swift
//  Pods
//
//  Created by Joey on 17/04/2017.
//
//

import Foundation
import Moya
import Result

public final class LoadingPlugin: PluginType {
    
    public init() {}
    
    public func willSend(_ request: RequestType, target: TargetType) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let vc = UIApplication.shared.keyWindow!.visibleViewController else { return
        }
        vc.startActivity()
    }
    
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        guard let vc = UIApplication.shared.keyWindow!.visibleViewController else { return
        }
        vc.stopActivity()
    }
}
