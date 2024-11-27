//
//  Target.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

struct Goal: Identifiable {
    
    var id = UUID()
    var title: String
    var descriptionText: String
    var createDate: String
    var deadline: String
    var isCompleted = false
}

