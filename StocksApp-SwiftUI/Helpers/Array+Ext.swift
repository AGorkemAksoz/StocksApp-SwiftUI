//
//  Array+Ext.swift
//  StocksApp-SwiftUI
//
//  Created by Ali Görkem Aksöz on 30.08.2023.
//

import Foundation

extension Array where Element == CGFloat {
    var normalizedValues: [CGFloat] {
        if let min = self.min(), let max = self.max() {
            return self.map({($0 - min) / (max - min)})
        }
        return []
    }
}
