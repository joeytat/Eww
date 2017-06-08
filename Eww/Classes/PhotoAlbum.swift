//
//  PhotoAlbum.swift
//  AlphaTrion
//
//  Created by Joey on 02/06/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import Photos
import RxSwift

private var targetName: String {
    return Bundle.main.infoDictionary!["CFBundleDisplayName"]! as! String
}

public class CustomPhotoAlbum {
    static let albumName = targetName
    static let sharedInstance = CustomPhotoAlbum()
    
    public var assetCollection: PHAssetCollection!
    
    init() {
        if let assetCollection = fetchAssetCollectionForAlbum() {
            self.assetCollection = assetCollection
            return
        }
        
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
        
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            self.createAlbum()
        } else {
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
    }
    
    private func requestAuthorizationHandler(status: PHAuthorizationStatus) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            self.createAlbum()
        }
    }
    
    private func createAlbum() {
        guard let assetCollection = fetchAssetCollectionForAlbum() else {
            PHPhotoLibrary.shared().performChanges({
                PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: CustomPhotoAlbum.albumName)
            }) { (success, error) in
                if success {
                    self.assetCollection = self.fetchAssetCollectionForAlbum()
                } else {
                    print("createAlbum failed \(error?.localizedDescription ?? "")")
                }
            }
            return
        }
        self.assetCollection = assetCollection
    }
    
    private func fetchAssetCollectionForAlbum() -> PHAssetCollection? {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", CustomPhotoAlbum.albumName)
        let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        
        return collection.firstObject
    }
    
    public func save(image: UIImage) -> Observable<String> {
        return Observable.create {[weak self] observer in
            guard let assetCollection = self?.assetCollection else {
                observer.onCompleted()
                return Disposables.create()
            }
            
            var assetLocalId = ""
            PHPhotoLibrary.shared().performChanges({
                let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
                let assetPlaceHolder = assetChangeRequest.placeholderForCreatedAsset
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollection)
                let enumeration: NSArray = [assetPlaceHolder!]
                albumChangeRequest!.addAssets(enumeration)
                
                assetLocalId = assetPlaceHolder!.localIdentifier
            }, completionHandler: { success, error in
                observer.onNext(assetLocalId)
                observer.onCompleted()
            })
            
            return Disposables.create()
        }
    }
    
    public func delete(localIdentifiers: [String]) {
        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: localIdentifiers, options: nil)
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.deleteAssets(fetchResult)
        }, completionHandler: nil)
    }
}
