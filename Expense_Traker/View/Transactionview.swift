//
//  NewExpenseView.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-08-25.
//

import SwiftUI

struct Transactionview: View {
    ///Env Properties
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var editTransaction: Transaction?
    //View Properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount : Double = .zero
    @State private var dateAdded: Date = .now
    @State private var category: Category = .expense
    //Random tint
    @State var tint: TintColor = tints.randomElement()!
    
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 15){
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .hSpacing(.leading)
                
                //Preview Transaction Card View
                TransactionCardView(transaction: .init(title: title.isEmpty ? "Title": title, remarks: remarks.isEmpty ? "Remarks": remarks, amount: amount, dataAdded: dateAdded, category: category, tintColor: tint))
                
                CustomSection("Title", "Air Buds", value: $title)
                
                CustomSection("Remarks", "Apple Products", value: $remarks)
                
               //Amount & category check box
                VStack(alignment: .leading, content: {
                    Text("Amount & Category")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    
                    HStack(spacing: 15){
                        HStack(spacing: 4){
                            Text(currencySymbol)
                                .font(.callout.bold())
                            TextField("0.0", value: $amount, formatter: numberFormatter)
                                .keyboardType(.decimalPad)
                        }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .background(.background, in: .rect(cornerRadius: 10))
                            .frame(maxWidth: 130)
                            
                        
                        //Custom Check Box
                        CategoryCheckBox()
                    }
                })
                //Date Picker
                VStack(alignment: .leading, content: {
                    Text("Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    
                    DatePicker("", selection: $dateAdded, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .background(.background, in: .rect(cornerRadius: 10))
               })
            }
            .padding(15)
        }
        .navigationTitle("\(editTransaction == nil ? "Add" : "Edit") Transaction")
        .background(.gray.opacity(0.15))
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing){
                Button("Save", action: save )
            }
        })
        .onAppear(perform: {
            if let editTransaction{
                ///Load  all Existing Data from the Transaction
                title = editTransaction.title
                remarks = editTransaction.remarks
                dateAdded = editTransaction.dateAdded
                if let category = editTransaction.rawCategory{
                    self.category = category
                }
                amount = editTransaction.amount
                if let tint = editTransaction.tint{
                    self.tint = tint
                }
            }
        })
    }
    
    
    //Saving Date
    func save(){
        ///Saving Item to SwiftData
        if editTransaction != nil {
            editTransaction?.title = title
            editTransaction?.remarks = remarks
            editTransaction?.amount = amount
            editTransaction?.category = category.rawValue
            editTransaction?.dateAdded = dateAdded
        } else {
            let transaction = Transaction(title: title, remarks: remarks, amount: amount, dataAdded: dateAdded, category: category, tintColor: tint)
            
            context.insert(transaction)
        }
        //dismissing View
        dismiss()
    }
    @ViewBuilder
    func CustomSection(_ title: String,_ hint: String, value: Binding <String>) -> some View{
        VStack(alignment: .leading, spacing: 10, content: {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            TextField(hint, text: value)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.background, in: .rect(cornerRadius: 10))
        })
    }
    
    //Custome Check Box
    @ViewBuilder
    func CategoryCheckBox() -> some View{
        HStack(spacing: 10){
            ForEach(Category.allCases, id: \.rawValue){ category in
                HStack(spacing: 5){
                    ZStack{
                        Image(systemName: "circle")
                            .font(.title3)
                            .foregroundColor(appTint)
                        
                        if self.category == category{
                            Image(systemName: "circle.fill")
                                .font(.caption)
                                .foregroundColor(appTint)
                        }
                    }
                    Text(category.rawValue)
                        .font(.caption)
                }
               .contentShape(.rect)
               .onTapGesture {
                   self.category = category
               }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        .hSpacing(.leading)
        .background(.background, in: .rect(cornerRadius: 10))
    }
    //Number formatter
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter . numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview {
    NavigationStack{
        Transactionview()
    }
}
