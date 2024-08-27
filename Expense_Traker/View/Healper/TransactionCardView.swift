//
//  TransactionCardView.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-31.
//

import SwiftUI

struct TransactionCardView: View {
    @Environment(\.modelContext) private var context
    var transaction: Transaction
    var ShowsCategory: Bool = false
    
    var body: some View {
        SwipeAction(cornerRadius:10, direction: .trailing){
            HStack(spacing: 12){
                Text("\(String(transaction.title.prefix(1)))")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45, alignment: .center)
                    .background(transaction.color.gradient, in: .circle)
                
                VStack(alignment: .leading, spacing: 4, content: {
                    Text(transaction.title)
                        .foregroundStyle(Color.primary)
                    
                    Text(transaction.remarks)
                        .font(.caption)
                        .foregroundStyle(Color.primary.secondary)
                    
                    Text(format(date: transaction.dateAdded, format: "dd MMM yyyy"))
                        .font(.caption2)
                        .foregroundStyle(.gray)
                    
                    if ShowsCategory{
                        Text(transaction.category)
                            .font(.caption2)
                            .padding(.horizontal, 8)
                            .padding(.vertical,2)
                            .foregroundStyle(.white)
                            .background(transaction.category == Category.income.rawValue ? Color.green.gradient : Color.red.gradient, in: .capsule)
                    }
                })
                .lineLimit(1)
                .hSpacing(.leading)
                
                Text(currencyString(transaction.amount ,allowedDigits:1))
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(.background, in: .rect(cornerRadius: 10))
        }actions: {
            Action(tint: .red, icon: "trash") {
                context.delete(transaction)
            }
        }
    }
}

#Preview {
    ContentView()
}
