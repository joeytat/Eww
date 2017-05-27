//
//  ImagePicker+Extension.swift
//  Tea
//
//  Created by Joey on 21/04/2017.
//  Copyright © 2017 Miaomi. All rights reserved.
//

import Foundation
import Photos
import BSImagePicker
import RxSwift

public extension UIViewController {
    public func displayImagePicker(maxImage: Int, takePhotos: Bool = false) -> Observable<[PHAsset]> {
        return Observable<[PHAsset]>.create {[weak self] observable in
            let vc = BSImagePickerViewController()
            vc.maxNumberOfSelections = maxImage
            
            if let color = self?.navigationController?.navigationBar.tintColor {
                vc.cancelButton.setTitleTextAttributes([NSForegroundColorAttributeName : color], for: UIControlState.normal)
                vc.cancelButton.setTitleTextAttributes([NSForegroundColorAttributeName : color], for: UIControlState.highlighted)
            } else {
                vc.cancelButton.tintColor = self?.navigationController?.navigationBar.tintColor
                vc.doneButton.tintColor = self?.navigationController?.navigationBar.tintColor
            }
            vc.takePhotos = takePhotos
            self?.bs_presentImagePickerController(
                vc,
                animated: true,
                select: { (asset: PHAsset) -> Void in
            },
                deselect: { (asset: PHAsset) -> Void in
                    
            },
                cancel: { (assets: [PHAsset]) -> Void in
                    observable.onNext([])
                    observable.onCompleted()
            },
                finish: { (assets: [PHAsset]) -> Void in
                    observable.onNext(assets)
                    observable.onCompleted()
            },
                completion: nil)
            return Disposables.create()
        }
    }
}

public extension PHAsset {
    public func reqeustImageData(targetSize: CGSize, contentMode: PHImageContentMode, options: PHImageRequestOptions?) -> Observable<UIImage?> {
        return Observable<UIImage?>.create {[weak self] observable in
            PHImageManager()
                .requestImage(for: self!, targetSize: targetSize, contentMode: contentMode, options: options) { (image, _) in
                    observable.onNext(image)
                    observable.onCompleted()
            }
            return Disposables.create()
        }
    }
}
