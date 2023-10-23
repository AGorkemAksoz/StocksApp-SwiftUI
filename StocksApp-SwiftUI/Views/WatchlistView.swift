//
//  WatchlistView.swift
//  StocksApp-SwiftUI
//
//  Created by Ali Görkem Aksöz on 26.08.2023.
//

import SwiftUI

struct WatchlistView: View {
    @StateObject  var stocksVM: StocksViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Watchlist")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.darkBlue)
                Spacer()
            }
            ScrollView {
                VStack{
                    ForEach(stocksVM.stocks, id: \.self) { stock in
                        StockCard(stockModel: stock)
                    }
                }
            }
            .padding(3)
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView(stocksVM: StocksViewModel())
    }
}
