//
//  EmptyCellView.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 28.11.24.
//

import SwiftUI

struct EmptyCellView: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 40, height: 40)
    }
}
