//
//  Transaction.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-26.
//

import SwiftUI
import SwiftData
@Model
class Transaction{
    //proprties
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    
    init(title: String, remarks: String, amount: Double, dataAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dataAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    //Extracting Color Value from tintColor String
    var color: Color {
        return tints.first(where: {$0.color == tintColor})?.value ?? appTint
    }
}

////Sample Transactions for UI testing
//var sampleTransactions: [Transaction] = [
//    .init(title: "AirBuds", remarks: "Apple Product", amount: 299, dataAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "iPad", remarks: "Apple Product", amount: 959.65, dataAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "Macbbok", remarks: "Apple Product", amount: 1599.40, dataAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "Payment", remarks: "Trading Payment", amount: 5699, dataAdded: .now, category: .income, tintColor: tints.randomElement()!)
//]
