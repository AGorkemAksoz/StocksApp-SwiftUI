//
//  HeaderView.swift
//  StocksApp-SwiftUI
//
//  Created by Ali Görkem Aksöz on 21.08.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("My Stocks")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.darkBlue)
            Spacer()
            Button {
                print("Search button tapped!")
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .foregroundColor(.darkBlue)
                    .font(.system(size: 40))
            }

        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .padding()
    }
}
