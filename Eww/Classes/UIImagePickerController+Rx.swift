//
//  UIImagePickerViewController+Rx.swift
//  AlphaTrion
//
//  Created by Joey on 02/06/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public class RxUIImagePickerControllerDelegateProxy: DelegateProxy, DelegateProxyType, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public static func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        guard let pickerVC = object as? UIImagePickerController,
            let d = delegate as? (UIImagePickerControllerDelegate & UINavigationControllerDelegate) else {
                return
        }
        pickerVC.delegate = d
    }
    
    public static func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let pickerVC = object as! UIImagePickerController
        return pickerVC.delegate
    }
    
}

public extension Reactive where Base: UIImagePickerController {
    public var rx_delegate: DelegateProxy {
        return RxUIImagePickerControllerDelegateProxy.proxyForObject(base)
    }
    
    public var didFinishPickingMediaWithInfo: Observable<[String : Any]> {
        return rx_delegate
            .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerController(_:didFinishPickingMediaWithInfo:)))
            .map { parameters in
                // 0 is UIImagePickerController
                return parameters[1] as! [String : Any]
        }
    }
    
    public var didCancel: Observable<Void> {
        return rx_delegate
            .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerControllerDidCancel(_:)))
            .map { parameters in
                return
        }
    }
    
    public static func createWithParent(_ parent: UIViewController?, animated: Bool = true, configureImagePicker: @escaping(UIImagePickerController) throws -> () = { x in }) -> Observable<UIImagePickerController> {
        return Observable.create { [weak parent] observer in
            let imagePicker = UIImagePickerController()
            let dismissDisposable = imagePicker.rx
                .didCancel
                .subscribe(onNext: {[weak imagePicker] _ in
                    guard let imagePicker = imagePicker else {
                        return
                    }
                    return dismissViewController(imagePicker, animated: animated)
                })
            
            do {
                try configureImagePicker(imagePicker)
            } catch let error {
                observer.on(.error(error))
                return Disposables.create()
            }
            
            guard let parent = parent else {
                observer.on(.completed)
                return Disposables.create()
            }
            
            parent.present(imagePicker, animated: animated, completion: nil)
            observer.on(.next(imagePicker))
            
            return Disposables.create(dismissDisposable, Disposables.create {
                dismissViewController(imagePicker, animated: animated)
            })
        }
    }
}

public func dismissViewController(_ viewController: UIViewController, animated: Bool) {
    if viewController.isBeingDismissed || viewController.isBeingPresented {
        DispatchQueue.main.async {
            dismissViewController(viewController, animated: animated)
        }
        return
    }
    
    if viewController.presentingViewController != nil {
        viewController.dismiss(animated: animated, completion: nil)
    }
}
