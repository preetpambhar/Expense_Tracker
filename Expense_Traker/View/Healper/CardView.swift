//
//  CardView.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-26.
//

import SwiftUI

struct CardView: View {
    var income: Double
    var expense: Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
            
            VStack(spacing: 0){
                HStack(spacing: 12){
                    Text("\(currencyString(income - expense))")
                        .font(.title.bold())
                    
                    Image(systemName: expense > income ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundStyle(expense > income ? .red : .green)
                }
                .padding(.bottom, 25)
            }
        }
    }
}

#Preview {
    ScrollView{
        CardView(income: 8456, expense: 2221)
    }
}
