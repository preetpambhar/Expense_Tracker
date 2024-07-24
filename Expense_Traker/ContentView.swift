//
//  ContentView.swift
//  Expense_Traker
//
//  Created by Preet Pambhar on 2024-07-23.
//

import SwiftUI

struct ContentView: View {
    //IntroVisiblity Status
    @AppStorage("isFirstTime") private var isfirsttime : Bool = true
    
    //Active Tab
    @State private var activeTab: Tab = .recents
    var body: some View {
        TabView(selection: $activeTab){
            Text("Recents")
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            
            Text("Search")
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            
            Text("Chart")
                .tag(Tab.charts)
                .tabItem { Tab.charts.tabContent }
            
            Text("Settings")
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        }
        .tint(appTint)
        .sheet(isPresented: $isfirsttime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
