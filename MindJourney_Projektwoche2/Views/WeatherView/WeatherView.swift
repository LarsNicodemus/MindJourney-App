//
//  WeatherView.swift
//  Journal
//
//  Created by Lars Nicodemus on 27.11.24.
//

import SwiftUI

struct WeatherView: View {
    var weather: Weather = MOCKDAY.weather
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    TimelineView(.periodic(from: Date(), by: 1.0)) { context in
                        Text(
                            Date.now.formatted(
                                .dateTime
                                    .year()
                                    .month()
                                    .day()
                                    .hour()
                                    .minute()
                                    .second()
                                    .locale(Locale(identifier: "de_DE"))
                            )
                        )
                        .font(.caption)
                    }
                    HStack {
                        Text(weather.descriprion.rawValue)
                        Text(String(format: "%.2f °C", weather.temperatur))
                    }
                }
                Spacer()
                GifImageView(weather.descriprion.gif)
                    .frame(width: 100, height: 100)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
    }
}

#Preview {
    WeatherView()
}
