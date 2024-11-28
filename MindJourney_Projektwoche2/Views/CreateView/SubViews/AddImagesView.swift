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
        HStack {
            Spacer()
            VStack {
                if selectedImages.count > 0 {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(selectedImages, id: \.self) { img in
                                Image(uiImage: img)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipShape(.rect(cornerRadius: 3))
                            }
                        }
                    }
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.2))
                        .frame(width: 200, height: 180)
                        .overlay {
                            Image(systemName: "photo")
                                .foregroundStyle(.gray)
                                .font(.system(size: 130))
                        }
                }
            }
            Spacer()
        }
        .onChange(of: selectedItems) { oldValues, newValues in
            print("Ausgewählte Bilder: \(newValues.debugDescription)")
            Task {
                selectedImages = []
                for value in newValues {
                    if let imageData = try? await value.loadTransferable(
                        type: Data.self), let image = UIImage(data: imageData)
                    {
                        selectedImages.append(image)
                    }
                }
            }
        }

        VStack {
            PhotosPicker(
                selection: $selectedItems,
                matching: .images
            ) {
                Label("Select Photo", systemImage: "photo")
            }.buttonStyle(.borderedProminent)
        }
    }
}


