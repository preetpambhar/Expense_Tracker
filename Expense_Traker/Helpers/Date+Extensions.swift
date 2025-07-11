//
//  Date+Extensions.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-26.
//

import SwiftUI

extension Date {
    var startOfMonth: Date {
        let calendar  = Calendar.current
        let components = calendar.dateComponents([ .year, .month],from: self)
        return calendar.date(from: components) ?? self
    }
    var endOfMonth: Date {
        let calendar  = Calendar.current
        
        return calendar.date(byAdding: .init(month: 1, minute: -1), to: self.startOfMonth) ?? self
    }
}
