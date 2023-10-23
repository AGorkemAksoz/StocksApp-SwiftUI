//
//  Candle.swift
//  StocksApp-SwiftUI
//
//  Created by Gorkem on 23.10.2023.
//

import Foundation

// MARK: - Candle
struct Candle: Codable {
    let c, h, l, o: [Double]
    let s: String
    let t, v: [Int]
}
