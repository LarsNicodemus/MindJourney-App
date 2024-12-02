//
//  TodayEntrieSubView.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 02.12.24.
//

import SwiftUI

struct TodayEntrieSubView: View {
    @ObservedObject var createVM: CreateViewModel
    var entry: Day
    var body: some View {
        VStack(alignment: .leading) {
        
            HStack {
                Text("\(entry.date.formatted(.dateTime.year(.twoDigits).month().day().locale(Locale(identifier: "de_DE"))))")
                    .bold()
                    .foregroundColor(.black)
                    .font(.caption)
                Spacer()
                    Text("\(entry.mood.emoji)")
                
            }
            .padding(.top, 4)
            .padding(.bottom, 16)
            Text(entry.text)
                .foregroundColor(.black)
                .font(.caption)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 16)

            if entry.pictures != [] {
                if let uiimage = createVM.loadImage(
                    from: entry.pictures[0]
                ) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(.rect(cornerRadius: 3))
                }
            }
            Spacer()
        }
        .frame(width: 100 ,height: 150)
        .padding(8)
        .background(.gray.mix(with: hexStringToColor2(entry.colors)!, by: 0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TodayEntrieSubView(createVM: CreateViewModel(), entry: MOCKDAY)
}
