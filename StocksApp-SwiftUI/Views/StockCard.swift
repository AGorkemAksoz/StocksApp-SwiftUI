//
//  StockCard.swift
//  StocksApp-SwiftUI
//
//  Created by Ali Görkem Aksöz on 23.08.2023.
//

import SwiftUI

struct StockCard: View {
    var body: some View {
        VStack {
            HStack {
                //                AsyncImage(url: URL(string: "https://logo.clearbit.com/apple.com"))
                Image(systemName: "appletv.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    Text("AAPL")
                        .bold()
                        .font(.title3)
                    Text("Apple Inc.")
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                Spacer()
                
                Text("1.2%")
                    .bold()
                    .font(.title3)
                    .foregroundColor(.lightGreen)
            }
            Spacer()
            
            HStack {
                Text("$137.59")
                    .font(.title)
                    .bold()
                Spacer()
                Text("Graph")
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
    }
}

struct StockCard_Previews: PreviewProvider {
    static var previews: some View {
        StockCard()
    }
}
