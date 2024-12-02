//
//  PicturePreviewView.swift
//  Journal
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct PicturePreviewView: View {
    var images: [String]
    var onTapImage: (Int) -> Void
    @State private var imageLayouts: [ImageLayout]
    @StateObject private var createVM: CreateViewModel = CreateViewModel()

    struct ImageLayout {
        let frame: (width: CGFloat, height: CGFloat)
        let offsetX: CGFloat
        let offsetY: CGFloat
        let rotation: Double
    }

    init(images: [String], onTapImage: @escaping (Int) -> Void) {
        self.images = images
        self.onTapImage = onTapImage
        _imageLayouts = State(initialValue: images.map { _ in
            ImageLayout(
                frame: randomFrame(),
                offsetX: randomOffsetX(),
                offsetY: randomOffsetY(),
                rotation: randomRotationEfect()
            )
        })
    }

    var body: some View {
        ZStack {
            if images.isEmpty {
                Image(systemName: "photo.on.rectangle.angled.fill")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(4)
                    .aspectRatio(contentMode: .fit)
                    
            }
            ForEach(images.indices, id: \.self) { index in
                let layout = imageLayouts[index]
                //Image(uiImage: images[index])
                if let uiimage = createVM.loadImage(
                    from: images[index]
                ){
                    Image(uiImage: uiimage)
                        .resizable()
                        .frame(width: layout.frame.width, height: layout.frame.height)
                        .cornerRadius(4)
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(Angle(degrees: layout.rotation))
                        .offset(x: layout.offsetX, y: layout.offsetY)
                        .onTapGesture {
                            onTapImage(index)
                        }
                }
//                Image(images[index])
//                    .resizable()
//                    .frame(width: layout.frame.width, height: layout.frame.height)
//                    .cornerRadius(4)
//                    .aspectRatio(contentMode: .fit)
//                    .rotationEffect(Angle(degrees: layout.rotation))
//                    .offset(x: layout.offsetX, y: layout.offsetY)
//                    .onTapGesture {
//                        onTapImage(index)
//                    }
            }
        }
        .padding(32)
    }
}

func randomOffsetX() -> CGFloat {
    return CGFloat((-100...100).randomElement()!)
}
func randomOffsetY() -> CGFloat {
    return CGFloat((-20...20).randomElement()!)
}

func randomRotationEfect() -> Double {
    return Double((-20...20).randomElement()!)
}
func randomFrame() -> (width: CGFloat, height: CGFloat) {
    return Bool.random() ? (width: 160, height: 120) : (width: 120, height: 160)
}
