//
//  URL+Extension.swift
//  Cybertron
//
//  Created by Joey on 10/08/2017.
//  Copyright © 2017 JieJing. All rights reserved.
//

import Foundation

public extension URL {
    public var thumbnail: URL {
        return URL(string: self.absoluteString.appending("-thumbnail"))!
    }
}
