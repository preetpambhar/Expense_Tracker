//
//  TintColor.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-26.
//

import SwiftUI


//Custom Tint Colors for Transaction row

struct TintColor: Identifiable {
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Purple", value: .purple),
    .init(color: "Brown", value: .brown),
    .init(color: "Orange", value: .orange),
    
]
