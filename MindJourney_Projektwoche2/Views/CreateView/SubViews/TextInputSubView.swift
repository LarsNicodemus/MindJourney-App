//
//  TextInputSubView.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 27.11.24.
//

import SwiftUI

struct TextInputSubView: View {
    @ObservedObject var createVM: CreateViewModel
    
    var body: some View {
        TextEditor(text: $createVM.input)
            .frame(height: max(createVM.textFieldHeight, 50))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
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

