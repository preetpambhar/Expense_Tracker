//
//  Filter.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-08-26.
//

import SwiftUI
import SwiftData

//Custome View
struct FilterTransactionsView<Content: View>: View {
    var content: ([Transaction]) -> Content
    @Query(animation: .snappy)private var transactions : [Transaction]
    init(category: Category? , searchText: String, @ViewBuilder content: @escaping ([Transaction]) -> Content){
        //Custom Predicate
        let rawValue = category?.rawValue ?? ""
        let predicate = #Predicate<Transaction> { transaction in
            return (transaction.title.localizedStandardContains(searchText) || transaction.remarks.localizedStandardContains(searchText)) && (rawValue.isEmpty ?  true : transaction.category == rawValue)
        }
        _transactions = Query(filter: predicate, sort: [
            SortDescriptor(\Transaction.dateAdded, order: .reverse)
        ], animation: .snappy)
        
        self.content = content
    }
    var body: some View {
        content(transactions)
    }
}
