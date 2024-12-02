//
//  AppNavigationView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

struct AppNavigationView: View {
    
    @State var activeTab: TabModel = .today
    @State var createIsVisible: Bool = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
            ZStack{
                VStack{
                    TabView(selection: $activeTab) {
                        ForEach(TabModel.allCases, id: \.rawValue) { tab in
                            HStack{
                                tab.navigateTo
                            }.tag(tab)
                        }
                    }
                }
                VStack {
                    Spacer()
                    CustomTabBarView(activeTab: $activeTab, createIsVisible: $createIsVisible)
                }.sheet(isPresented: $createIsVisible) {
                    CreateView().presentationDetents([.large])
                }
            }
            .toolbar(.hidden)
            
    }
}

#Preview {
    AppNavigationView()
}
