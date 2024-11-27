//
//  GoalOverView.swift
//  Journal
//
//  Created by Lars Nicodemus on 27.11.24.
//

import SwiftUI

struct GoalOverView: View {
    @StateObject var goalVM: GoalViewModel = GoalViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach($goalVM.goals) { $goal in
                    NavigationLink(destination: GoalView(goalVM: goalVM, goal: $goal)) {
                        GoalPreview(goalVM: goalVM, goal: $goal)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    GoalOverView()
}
