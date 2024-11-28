//
//  AddImagesView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 26.11.24.
//

import PhotosUI
import SwiftUI

struct AddImagesView: View {

    @Binding var selectedImages: [UIImage]
    @State var selectedItems = [PhotosPickerItem]()

    var body: some View {
        VStack {
            
            if selectedImages.count > 0 {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(selectedImages, id: \.self) { img in
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding(.bottom)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
                    .frame(width: 200, height: 180)
                    .overlay {
                        Image(systemName: "photo")
                            .foregroundStyle(.gray)
                            .font(.system(size: 130))
                    }
                    .padding(.bottom)
            }

            
            PhotosPicker(
                selection: $selectedItems,
                matching: .images
            ) {
                Label("Fotos auswählen", systemImage: "photo")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)

        }
        .padding()
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.5),
                                Color.purple.opacity(0.5)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 5, y: 5)
                    .shadow(color: Color.purple.opacity(0.4), radius: 10, x: -5, y: -5)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .opacity(0.8)
            }
        )
        .onChange(of: selectedItems) { oldValues, newValues in
            Task {
                selectedImages = []
                for value in newValues {
                    if let imageData = try? await value.loadTransferable(type: Data.self),
                       let image = UIImage(data: imageData) {
                        selectedImages.append(image)
                    }
                }
            }
        }
    }
}


