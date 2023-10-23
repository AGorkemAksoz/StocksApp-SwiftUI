//
//  StockModel.swift
//  StocksApp-SwiftUI
//
//  Created by Gorkem on 23.10.2023.
//

import Foundation

struct StockModel: Hashable {
    let symbol: String //AAPL
    let description: String? // Apple Inc
    let currentPrice: Double? // 150.20
    let percentageChange: Double?
    let candles: [CGFloat]
}
