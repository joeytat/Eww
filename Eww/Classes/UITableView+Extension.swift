//
//  UITableView+Extension.swift
//  Tea
//
//  Created by Joey on 02/05/2017.
//  Copyright © 2017 Miaomi. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

enum TableLoadingType {
    case refresh
    case next
    case none
}

extension UITableView {
    
    func isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
    
    var rowCount: Int {
        get {
            let sectionCount = numberOfSections
            let rowCount = Array(repeating: 0, count: sectionCount).reduce(0) { acc, nextSectionIndex in
                return acc + numberOfRows(inSection: nextSectionIndex)
            }
            return rowCount
        }
    }
    
    var loadNextPageTrigger: Observable<Int> {
        get {
            let tableView = self
            
            let loading = rx.contentOffset
                .observeOn(MainScheduler.instance)
                .map { _ -> TableLoadingType in
                    if tableView.contentOffset.y < -20 {
                        return .refresh
                    } else if tableView.isNearBottomEdge() {
                        return .next
                    } else {
                        return .none
                    }
                }
                .distinctUntilChanged()
            
            return loading
                .scan(1) {acc, type in
                    switch type {
                    case .refresh:
                        return 1
                    case .next:
                        return Int((Float(tableView.rowCount) / Float(20) + 0.5)) + 1
                    case .none:
                        return acc
                    }
                }
                .distinctUntilChanged()
                .shareReplay(1)
        }
    }
    
}
