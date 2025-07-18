//
//  DataFilterView.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-08-03.
//

import SwiftUI

struct DateFilterView: View {
    @State var start: Date
    @State var end: Date
    var onSubmit: (Date,Date) -> ()
    var onClose: () -> ()
    var body: some View {
        VStack(spacing: 15){
            DatePicker("Start Date", selection: $start, displayedComponents: [.date])
            DatePicker("End Date", selection: $end, displayedComponents: [.date])
            
            
            HStack(spacing:15){
                Button("Cancle"){
                    onClose()
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(.red)  
                Button("Filter"){
                    onSubmit(start, end)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(appTint)
               }
            .padding(.top,10)
        }
        .padding(15)
        .background(.bar, in: .rect(cornerRadius: 10))
        .padding(.horizontal, 30)
    }
}
