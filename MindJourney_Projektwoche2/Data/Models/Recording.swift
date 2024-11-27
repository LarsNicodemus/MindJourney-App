//
//  Recording.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 26.11.24.
//
import SwiftUI

struct Recording: Identifiable {
    //Recording (url: url, date: creationDate, sequence: sequence)
    var id = UUID()
    var url: URL
    var date: Date
    var sequence: Int
    
    init(url: URL, date: Date, sequence: Int) {
        self.url = url
        self.date = date
        self.sequence = sequence
    }
}
