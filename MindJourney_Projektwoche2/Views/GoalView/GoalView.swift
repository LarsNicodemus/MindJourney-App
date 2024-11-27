//
//  GoalView.swift
//  Journal
//
//  Created by Lars Nicodemus on 27.11.24.
//

import SwiftUI

struct GoalView: View {
    @ObservedObject var goalVM: GoalViewModel
    @Binding var goal: Goal

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(goalVM.goal.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)

                Text(goalVM.goal.descriptionText)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(5)
                    .padding(.bottom, 8)

                ProgressView(value: goalVM.progress())
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                    .background(
                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.4))
                                .frame(width: geo.size.width, height: 4)
                        }
                    )
                    .frame(height: 8)
                    .cornerRadius(4)
                    .padding(.vertical, 8)

                HStack{
                    Text("Erstellt am: \(goalVM.goal.createDate)")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.6))
                    Spacer()

                    Button(action: {
                        goalVM.toggleIsComplete(goal: goal)
                        
                    }) {
                        Image(systemName: "checkmark.square.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(goal.isCompleted ? .green : .gray)
                    }
                }

                HStack {
                    Text("Deadline: \(goalVM.goal.deadline)")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.yellow)

                    Spacer()

                    Button(action: {
                        print("Bearbeiten gedrückt")
                    }) {
                        Text("Bearbeiten")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue.opacity(0.7), Color.blue.opacity(0.3)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}


#Preview {
    GoalView(goalVM: GoalViewModel(), goal: .constant(MOCKGOAL))
}
