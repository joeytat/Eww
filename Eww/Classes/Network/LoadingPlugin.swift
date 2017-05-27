//
//  ATLoadingPlugin.swift
//  AlphaTrion
//
//  Created by Joey on 27/05/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import Moya
import UIKit
import Result

private let kLoadingTag = 230001

public final class LoadingPlugin: PluginType {
    
    public init() {}
    
    public func willSend(_ request: RequestType, target: TargetType) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let window = UIApplication.shared.keyWindow,
            (window.viewWithTag(kLoadingTag) == nil) else { return }
        let loading = loadingViewConstructor()
        window.addSubview(loading)
        loading.snp.makeConstraints { make in
            make.center.equalTo(window)
            make.width.equalTo(80)
            make.height.equalTo(60)
        }
        delay(0.4) {
            UIView.animate(withDuration: 0.1, animations: {
                loading.alpha = 1
            })
        }
    }
    
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        guard let window = UIApplication.shared.keyWindow,
            let loading = window.viewWithTag(kLoadingTag)
            else { return }
        
        UIView.animate(withDuration: 0.15, animations: {
            loading.alpha = 0.0
        }) { _ in
            loading.removeFromSuperview()
        }
    }
}

private func loadingViewConstructor() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor(hue:0.00, saturation:0.00, brightness:0.6, alpha:0.7)
    view.cornerRadius = 4
    view.tag = kLoadingTag
    view.alpha = 0.0
    
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
    indicator.startAnimating()
    view.addSubview(indicator)
    
    indicator.snp.makeConstraints { make in
        make.center.equalTo(view)
    }
    return view
}
