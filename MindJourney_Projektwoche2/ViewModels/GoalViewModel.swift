//
//  GoalViewModel.swift
//  Test1
//
//  Created by Lars Nicodemus on 27.11.24.
//

import SwiftUI

class GoalViewModel: ObservableObject {
    @Published var goals: [Goal]
    @Published var goal: Goal

    init(goals: [Goal] = MOCKGOALS, goal: Goal = MOCKGOAL) {
        self.goals = goals
        self.goal = goal
    }
    
    func creationDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.date(from: goal.createDate)
    }

    func deadlineDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.date(from: goal.deadline)
    }

    func progress() -> Double {
        guard
            let createDate = creationDate(),
            let deadline = deadlineDate()
        else { return 1.0 }

        let totalTime = Calendar.current.dateComponents(
            [.day], from: createDate, to: deadline
        ).day ?? 0
        let elapsedTime = Calendar.current.dateComponents(
            [.day], from: createDate, to: Date()
        ).day ?? 0

        if goal.isCompleted {
            return 1.0
        } else {
            return totalTime > 0 ? Double(elapsedTime) / Double(totalTime) : 1.0
        }
    }
    
    func toggleCompletion(for goal: Goal) {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index].isCompleted.toggle()
            objectWillChange.send() 
        }
    }
    func toggleIsComplete(goal: Goal) {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index].isCompleted.toggle()
        }
    }
    
}
