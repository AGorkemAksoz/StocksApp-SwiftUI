//
//  PortfolioCard.swift
//  StocksApp-SwiftUI
//
//  Created by Ali Görkem Aksöz on 21.08.2023.
//

import SwiftUI

struct PortfolioCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Portfolio Value")
                .font(.title2)
                .foregroundColor(.gray)
            
            HStack(alignment: .top) {
                Text("$1223.30")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                Text("2.1%")
                    .foregroundColor(.lightGreen)
                    .bold()
                    .font(.title3)
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text("Deposit")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.lightGreen)
                        )
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Withdraw")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                        )
                }

            }
        }
        .padding()
        .frame(height: UIScreen.main.bounds.height / 4)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.darkBlue)
        )
    }
}

struct PortfolioCard_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioCard()
            .padding()
    }
}
