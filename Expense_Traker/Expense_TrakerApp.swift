//
//  Expense_TrakerApp.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-23.
//

import SwiftUI
import WidgetKit

@main
struct Expense_TrakerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    WidgetCenter.shared.reloadAllTimelines()
                }
        }
        .modelContainer(for: [Transaction.self])
    }
}
