//
//  PHAsset+Rx.swift
//  AlphaTrion
//
//  Created by Joey on 02/06/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import RxSwift
import Photos

public extension Reactive where Base: PHAsset {
    public static func fetchAssets(withLocalIdentifiers identifiers: [String], options: PHFetchOptions?) -> Observable<[PHAsset]> {
        return Observable<[PHAsset]>.create { observer in
            guard identifiers.count != 0 else {
                observer.onNext([])
                observer.onCompleted()
                return Disposables.create()
            }
            let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: options)
            var assets: Array<PHAsset> = []
            fetchResult.enumerateObjects(using: { asset, count, stop in
                assets.append(asset)
            })
            observer.onNext(assets)
            observer.onCompleted()
            return Disposables.create()
        }
    }
}

public extension Reactive where Base: PHImageManager {
    public func requestImage(for asset: PHAsset,
                             targetSize: CGSize = CGSize(width: UIScreen.width * UIScreen.main.scale, height: UIScreen.height * UIScreen.main.scale),
                             contentMode: PHImageContentMode,
                             options: PHImageRequestOptions?) -> Observable<UIImage?> {
        return Observable<UIImage?>.create{ observer in
            PHImageManager()
                .requestImage(for: asset, targetSize: targetSize, contentMode: contentMode, options: options) { (image, _) in
                    observer.onNext(image)
                    observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
