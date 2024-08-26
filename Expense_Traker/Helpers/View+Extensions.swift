//
//  View+Extensions.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-26.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxWidth: .infinity, alignment: alignment)
    }
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxHeight:.infinity, alignment: alignment)
    }
    
    var safeArea: UIEdgeInsets{
        if let windowSection = (UIApplication.shared.connectedScenes.first as? UIWindowScene){
            return windowSection.keyWindow?.safeAreaInsets ?? .zero
        }
        return .zero
    }
    
    func format(date: Date , format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func currencyString(_ value: Double, allowedDigits: Int = 2) -> String{
        let formatter = NumberFormatter ()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = allowedDigits
        
        return formatter.string(from: .init(value: value)) ?? ""
    }
    var currencySymbol: String{
        let locale = Locale.current
        
        return locale.currencySymbol ?? ""
    }
}
