//
//  APIRequest.swift
//  StocksApp-SwiftUI
//
//  Created by Gorkem on 23.10.2023.
//

import Foundation

class APIRequest {
    static let shared = APIRequest()
    private init() { }
    
    private var url = "https://finnhub.io/api/v1/"
    private var token = "&token=cjniqlhr01qmuvo9igpgcjniqlhr01qmuvo9igq0"
    
    public func getSymbolQouete(symbol: String, handler: @escaping(_ returnedQuote: Stock?) -> ()) {
        let query: String = "quote?symbol=\(symbol)"
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let quoteData = data else {
                    print("symbol search daya not valid")
                    return
                }
                
                let returnedQuote = try? JSONDecoder().decode(Stock.self, from: quoteData)
                handler(returnedQuote)
            }
            task.resume()
        }
    }
    
    public func getSymbolLookup(searchQuery: String, handler: @escaping(_ returnedSymbol: Symbol?) -> ()) {
        let query: String = "search?q=\(searchQuery)"
        
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                if let error = error {
                    print("error searching for symbols: \(error.localizedDescription)")
                    return
                } else {
                    guard let searchData = data else {
                        print("Symbol search not valid")
                        return
                    }
                    
                    let returnSymbol = try? JSONDecoder().decode(Symbol.self, from: searchData)
                    handler(returnSymbol)
                }
            }
            task.resume()
        }
    }
    
    public func getCandles(symbol: String, hourLength: Int, handler: @escaping (_ returnedCandle: Candle?) -> () ) {
        let endDate = Int(Date().timeIntervalSince1970)
        let startDate = Int(Calendar.current.date(byAdding: .day, value: -(hourLength), to: Date())?.timeIntervalSince1970 ?? Date().timeIntervalSince1970)
        
        let query = "stock/candle?symbol=\(symbol)&resolution=5&from=\(startDate)&to=\(endDate)"
        
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                if let error = error {
                    print("Error candle for symbol: \(error.localizedDescription)")
                    return
                } else {
                    guard let candleData = data else {
                        print("candle result not valid")
                        return
                    }
                    
                    let returnedCandles = try? JSONDecoder().decode(Candle.self, from: candleData)
                    handler(returnedCandles)
                }
            }
            task.resume()
        }
    }
}

