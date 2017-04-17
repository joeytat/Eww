//
//  ReuseView+Extension.swift
//  Eww
//
//  Created by Joey on 17/03/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation
import UIKit

public protocol ReusableView: class {
    static var reuseIdentifier: String {get}
}

public extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
extension UICollectionReusableView: ReusableView {}

public extension UITableView {
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
