//
//  PictureFullScreenView.swift
//  Test1
//
//  Created by Lars Nicodemus on 27.11.24.
//

import SwiftUI

struct PictureFullScreenView: View {
    var journalEntry: Day
    @Binding var currentIndex: Int
    @Binding var selectedImageIndex: Int
    @Binding var preview: Bool
    @Binding var swipeOffset: CGFloat

    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        preview = false
                    }
                }
            
            //Image(uiImage: journalEntry.pictures[selectedImageIndex])
            Image(journalEntry.pictures[selectedImageIndex])
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            swipeOffset = value.translation.width
                        }
                        .onEnded { value in
                            // Nach rechts swipen (vorheriges Bild)
                            if value.translation.width > 100
                                && selectedImageIndex > 0
                            {
                                withAnimation {
                                    selectedImageIndex -= 1
                                }
                            }
                            // Nach links swipen (nächstes Bild)
                            else if value.translation.width < -100
                                        && selectedImageIndex < journalEntry.pictures
                                .count - 1
                            {
                                withAnimation {
                                    selectedImageIndex += 1
                                }
                            }
                            
                            // Swipe-Offset zurücksetzen
                            withAnimation {
                                swipeOffset = 0
                            }
                        }
                )
                .onTapGesture {
                    withAnimation {
                        preview = false
                    }
                }
                .offset(x: swipeOffset)
        }
    }
}

