//
//  ContentView.swift
//  StocksApp-SwiftUI
//
//  Created by Gorkem on 21.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingStockSearchSheet: Bool = false
    var body: some View {
        VStack {
            HeaderView(showSheet: $isShowingStockSearchSheet)
            PortfolioCard()
            WatchlistView()
                
            Spacer()

        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $isShowingStockSearchSheet) {
            Text("Search View")
        }
        .onAppear {
            APIRequest.shared.getCandles(symbol: "AAPL", hourLength: 8) { returnedCandle in
                print(returnedCandle)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

