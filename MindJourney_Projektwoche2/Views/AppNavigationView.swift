//
//  AppNavigationView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

struct AppNavigationView: View {
    
    @State var activeTab: TabModel = .today
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationStack {
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
                    CustomTabBarView(activeTab: $activeTab)
                }
            }
        }
    }
}

#Preview {
    AppNavigationView()
}
