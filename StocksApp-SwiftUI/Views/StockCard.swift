//
//  StockCard.swift
//  StocksApp-SwiftUI
//
//  Created by Ali Görkem Aksöz on 23.08.2023.
//

import SwiftUI

struct StockCard: View {
    let stockModel: StockModel
    @State private var logoStr: String = ""
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: "https://logo.clearbit.com/\(logoStr).com")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading) {
                    Text(stockModel.symbol)
                        .bold()
                        .font(.title3)
                    Text(stockModel.description ?? "Unknown Description")
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                Spacer()
                
                Text("\(String(format: "%.2f", stockModel.percentageChange ?? 0))%")
                    .bold()
                    .font(.title3)
                    .foregroundColor(.lightGreen)
            }
            Spacer()
            
            HStack {
                Text("$\(String(format: "%.2f", stockModel.currentPrice ?? 0))")
                    .font(.title)
                    .bold()
                Spacer()
                LineChart(data: StockMockData.apple.normalizedValues)
                    .stroke(Color.lightGreen, lineWidth: 2)
                
            }
        }
        .padding(.all)
        .padding(5)
        .frame(height: UIScreen.main.bounds.height / 4 )
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray)
        )
        .onAppear(perform: {
            if let logoStr = stockModel.description?.components(separatedBy: " ").first {
                // get first word
                self.logoStr = logoStr.lowercased()
            }
        })
    }
}
//
//struct StockCard_Previews: PreviewProvider {
//    static var previews: some View {
//        StockCard()
//    }
//}
