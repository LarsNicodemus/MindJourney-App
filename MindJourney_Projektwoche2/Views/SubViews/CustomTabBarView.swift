//
//  CustomTabBarView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var activeTab: TabModel
    @Namespace private var animation
    @State private var tabLocation: CGRect = .zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                Button {
                    activeTab = tab
                } label: {
                    HStack(spacing: 5) {
                        Image(
                            systemName: activeTab == tab ? (tab.rawValue + ".fill") : tab.rawValue
                        )
                        .font(.title3)
                        .frame(width: 30, height: 30)
                        
                        if activeTab == tab {
                            Text(tab.title)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                        }
                    }
                    .foregroundStyle( .white )
                    .padding(.vertical, 2)
                    .padding(.trailing, 15)
                    .padding(.leading, 10)
                    .contentShape(.rect)
                    .background{
                        if activeTab == tab {
                            Capsule()
                                .fill(.green.gradient)
                                .onGeometryChange(for: CGRect.self, of: {
                                    $0.frame(in: .named("TABBARVIEW")) }, action: { newValue in
                                        tabLocation = newValue
                                    })
                                .matchedGeometryEffect(id: "ACTIVETAB",in: animation)
                        }
                    }
                }.buttonStyle(.plain)

            }
        }
        .coordinateSpace(.named("TABBARVIEW"))
        .padding(.horizontal,5)
        .frame(height: 45)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.blue,.purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .shadow(.drop(color: .black.opacity(0.2), radius: 5, x: 5, y: 5))
            .shadow(.drop(color: .black.opacity(0.2), radius: 5, x: -5, y: -5)),
            in: .capsule
        )
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}

#Preview {
    CustomTabBarView(activeTab: .constant(.today))
}
