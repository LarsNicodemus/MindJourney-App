//
//  TagsSubView 2.swift
//  Test1
//
//  Created by Lars Nicodemus on 27.11.24.
//
import SwiftUI


struct TagsSubView: View {
    var journalEntry: Day
    @Binding var tagsVisible: Bool
    var body: some View {
        VStack(alignment: .leading) {
            
            if !tagsVisible {
                Grid(horizontalSpacing: 5, verticalSpacing: 5) {
                    ForEach(
                        0..<Int(ceil(Double(journalEntry.tags.count) / 5.0)),
                        id: \.self
                    ) { rowIndex in
                        GridRow {
                            ForEach(
                                Array(
                                    journalEntry.tags.dropFirst(rowIndex * 5)
                                        .prefix(5)), id: \.self
                            ) { tag in
                                Text(tag)
                                    .frame(maxWidth: 70, maxHeight: 20)
                                    .font(.system(size: 10))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 4)
                                    .background(.green.opacity(0.5))
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerRadius: 10))
                            }
                        }
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.clear)
                        .stroke(.black, lineWidth: 0.5)
                }
            }
        }
    }
}
