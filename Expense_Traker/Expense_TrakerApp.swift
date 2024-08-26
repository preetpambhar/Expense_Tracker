//
//  Expense_TrakerApp.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-23.
//

import SwiftUI

@main
struct Expense_TrakerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Transaction.self])
    }
}
