//
//  ChartModel.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-08-28.
//

import SwiftUI

struct ChartGroup: Identifiable{
    let id: UUID = .init()
    var date: Date
    var categories: [ChartCategory]
    var totalIncome: Double
    var totalExpense: Double
}

struct ChartCategory: Identifiable{
    let id: UUID = .init()
    var totalValue: Double
    var category: Category
}
