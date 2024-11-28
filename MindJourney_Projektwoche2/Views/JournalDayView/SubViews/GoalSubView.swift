//
//  GoalSubView.swift
//  Test1
//
//  Created by Lars Nicodemus on 27.11.24.
//

import SwiftUI

struct GoalSubView: View {
    @Binding var goalisChecked: Bool
    var body: some View {
        HStack{
            Text("GOAL 1")
            Spacer()
            Button(action: {
                goalisChecked.toggle()
            }){
                Image(systemName: goalisChecked ? "checkmark.square.fill" : "checkmark.square.fill")
                    .tint(goalisChecked ? .green : .gray )
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.blue.opacity(0.1))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .stroke(.black, lineWidth: 0.5)
        }
    }
}

#Preview {
    GoalSubView(goalisChecked: .constant(false))
}
