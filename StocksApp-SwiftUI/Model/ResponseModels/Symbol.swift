//
//  Symbol.swift
//  StocksApp-SwiftUI
//
//  Created by Gorkem on 23.10.2023.
//

import Foundation

// MARK: - Symbol
struct Symbol: Codable {
    let count: Int
    let result: [Result]
}

// MARK: - Result
struct Result: Codable {
    let description, displaySymbol, symbol, type: String
}
