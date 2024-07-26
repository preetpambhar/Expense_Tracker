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
    .init(color: "Red", value: .blue),
    .init(color: "Red", value: .pink),
    .init(color: "Red", value: .purple),
    .init(color: "Red", value: .brown),
    .init(color: "Red", value: .orange),
    
]
