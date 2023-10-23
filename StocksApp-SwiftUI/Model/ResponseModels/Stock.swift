//
//  Stock.swift
//  StocksApp-SwiftUI
//
//  Created by Gorkem on 23.10.2023.
//

import Foundation

// MARK: - Stock
struct Stock: Codable {
    let c, d, dp, h: Double
    let l, o, pc: Double
    let t: Int
}
