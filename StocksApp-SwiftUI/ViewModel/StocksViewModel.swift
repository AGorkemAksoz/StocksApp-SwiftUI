//
//  StocksViewModel.swift
//  StocksApp-SwiftUI
//
//  Created by Gorkem on 23.10.2023.
//

import Foundation
import SwiftUI

class StocksViewModel: ObservableObject {
    var tickers = ["AAPL", "NVDA", "MSFT", "NKE"]
    
    @Published var stocks: [StockModel] = [StockModel]()
    
    init() {
        self.fetchStockData()
    }
    
    public func fetchStockData() {
        for ticker in tickers {
            APIRequest.shared.getSymbolLookup(searchQuery: ticker) { returnedSymbol in
                APIRequest.shared.getSymbolQouete(symbol: ticker) { returnedQuote in
                    APIRequest.shared.getCandles(symbol: ticker, hourLength: 12) { returnedCandle in
                        let candleArray: [CGFloat] = returnedCandle?.c.map { CGFloat($0)} ?? []
                        let stockInfo = returnedSymbol?.result[0]
                        let newStock = StockModel(symbol: ticker, description: stockInfo?.description, currentPrice: returnedQuote?.c, percentageChange: returnedQuote?.dp, candles: candleArray)
                        
                        DispatchQueue.main.async {
                            self.stocks.append(newStock)
                        }
                    }
                }
            }
        }
    }
}
