//
//  ContentView.swift
//  StocksApp-SwiftUI
//
//  Created by Gorkem on 21.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            PortfolioCard()
            HStack {
                Text("Watchlist")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.darkBlue)
                Spacer()
            }
            StockCard()
            StockCard()
            StockCard()
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

