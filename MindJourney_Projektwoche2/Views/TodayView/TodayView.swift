//
//  TodayView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        VStack{
            HStack {
                Spacer()
//                NavigationLink(destination: CreateView()) {
//                    HStack {
//                        Image(systemName: "plus")
//                            .font(.system(size: 20, weight: .bold))
//                        Text("Create")
//                            .font(.system(size: 18, weight: .bold, design: .rounded))
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(LinearGradient(
//                                gradient: Gradient(colors: [.blue,.purple]),
//                                startPoint: .topLeading,
//                                endPoint: .bottomTrailing
//                            ))
//                            .shadow(color: Color.purple.opacity(0.5), radius: 10, x: 5, y: 5)
//                    )
//                    .padding(.top)
//                }
            }
            .padding()
            Spacer()
        }.animatedBackground()
    }
}

#Preview {
    TodayView()
}
