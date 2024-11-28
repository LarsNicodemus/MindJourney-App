//
//  TextInputSubView.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 27.11.24.
//

import SwiftUI

struct TextInputSubView: View {
    @ObservedObject var createVM: CreateViewModel
    
    private let maxHeight: CGFloat = 300
    
    var body: some View {
        TextEditor(text: $createVM.input)
            .frame(height: min(max(createVM.textFieldHeight, 50), maxHeight))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .opacity(0.8)
                    .shadow(color: Color.purple.opacity(0.5), radius: 10, x: 5, y: 5)
            )
            .font(.system(size: 18, weight: .regular, design: .rounded))
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(.horizontal)
            .onChange(of: createVM.input) { oldValue, newValue in
                createVM.adjustHeight()
            }
    }
}

