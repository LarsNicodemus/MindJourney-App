//
//  WeatherView.swift
//  Journal
//
//  Created by Lars Nicodemus on 27.11.24.
//

import SwiftUI
import CoreLocation


struct WeatherView: View {
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @State var weather: Weather?
    var body: some View {

        VStack {
            
            if weather != nil {
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
                            Text(weather!.weatherDescription)
                            Text(String(format: "%.2f °C", weather!.temperatur))
                        }
                        
                    }
                    Spacer()
//                    GifImageView(weather!.weatherDescription.gif)
//                        .frame(width: 100, height: 100)
                }
            } else {
                LocationRequestView()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .onAppear {
            Task {
                if locationManager.userLocation == nil {
                    LocationManager.shared.requestLocation()
                } else if let location = locationManager.userLocation {
                    await weatherViewModel.fetchWeatherData(
                        latitude: location.coordinate.latitude,
                        longitude: location.coordinate.longitude
                    )
                    weatherViewModel.currentWeather = weatherViewModel.fetchCurrentWeather()
                    weather =  weatherViewModel.currentWeather
                    
                }
            }
        }
    }
}

#Preview {
    WeatherView()
}



struct LocationRequestView: View {
    var body: some View {
        VStack{
            
            Button{
                LocationManager.shared.requestLocation()
            } label: {
                Image(systemName: "paperplane.circle.fill")
                Text("Allow Location")
            }.buttonStyle(.borderedProminent)
        }
        .onAppear{
            print("Request Location from User")
        }
    }
}
