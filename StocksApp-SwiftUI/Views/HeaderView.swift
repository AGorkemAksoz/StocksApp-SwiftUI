//
//  HeaderView.swift
//  StocksApp-SwiftUI
//
//  Created by Ali Görkem Aksöz on 21.08.2023.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showSheet: Bool
    var body: some View {
        HStack {
            Text("My Stocks")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.darkBlue)
            Spacer()
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .foregroundColor(.darkBlue)
                    .font(.system(size: 40))
            }

        }
    }
}

