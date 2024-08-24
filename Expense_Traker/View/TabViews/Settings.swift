//
//  Settings.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-26.
//

import SwiftUI

struct Settings: View {
    //Usre Properties
    @AppStorage("userName") private var userName: String = ""
    //AppLock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    var body: some View {
        NavigationStack{
            List{
                Section("User Name") {
                    TextField("Enter Your Name",text: $userName)
                }
                Section("App Lock") {
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)
                    if isAppLockEnabled{
                        Toggle("Lock When App Goes Background", isOn: $lockWhenAppGoesBackground)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
