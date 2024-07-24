//
//  IntroScreen.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-23.
//

import SwiftUI

struct IntroScreen: View {
    
    //Visiblity Status
    @AppStorage("isFirstTime") private var isfirsttime : Bool = true
    var body: some View {
        VStack{
            Text("What's New in the \n Expense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            
            //Points View
            VStack (alignment: .leading, spacing: 2, content: {
                PointView(symbol: "dollarsign", title: "Transactions", subtitle: "Keep Track of your earning and expenses.")
                
                PointView(symbol: "chart.bar.fill", title: "Visual Charts", subtitle: "View your transactions using eye catching graphic representations.")
                
                PointView(symbol: "magnifyingglass", title: "Advance Filters", subtitle: "Find the expenses you want by advance search and filtering.")
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            Spacer(minLength: 10)
            Button(action: {
                isfirsttime = false
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
            })
        }
        .padding(15)
    }
    
    
    
    @ViewBuilder
    func PointView(symbol: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .foregroundStyle(.gray)
            })
        }
    }
}
#Preview {
    IntroScreen()
}
