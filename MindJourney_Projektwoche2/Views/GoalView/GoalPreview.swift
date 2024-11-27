//
//  GoalPreview.swift
//  Journal
//
//  Created by Lars Nicodemus on 27.11.24.
//
import SwiftUI

struct GoalPreview: View {
    @ObservedObject var goalVM: GoalViewModel
    @Binding var goal: Goal

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(goalVM.goal.title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(goalVM.goal.descriptionText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                HStack{
                    ProgressView(value: goalVM.progress())
                        .progressViewStyle(LinearProgressViewStyle(tint: .green))
                        .frame(width: 150 ,height: 6)
                        .padding(.vertical, 4)
                    if !goalVM.goal.isCompleted {
                        Text("Deadline")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Text(goalVM.goal.deadline)
                            .font(.caption2)
                            .foregroundColor(.red)
                    }
                }
            }

            Spacer()

            VStack {
                
                Button(action: {
                    goalVM.toggleIsComplete(goal: goal)
                }) {
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .tint(goal.isCompleted ? .green : .gray)
                }
            }
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.blue.opacity(0.7), Color.blue.opacity(0.3)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )))
        .padding(.horizontal)
    }
}


#Preview {
    GoalPreview(goalVM: GoalViewModel(), goal: .constant(MOCKGOAL))
}
