//
//  WeatherViewModel.swift
//  Test1
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    private let repository: WeatherRepository
    @Published var weatherData: WeatherData?
    @Published var isLoading = false
    @Published var error: Error?
    @Published var currentWeather: Weather?
    
    init(repository: WeatherRepository = RealWeatherRepository()) {
        self.repository = repository
    }
    
    @MainActor
    func fetchWeatherData(latitude: Double? = nil, longitude: Double? = nil) async {
        isLoading = true
        error = nil
        
        do {
            if let latitude = latitude, let longitude = longitude {
                weatherData = try await repository.getWeatherData(latitude: latitude, longitude: longitude)
            } else {
                weatherData = try await repository.getWeatherData()
            }
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
    
    @MainActor
    func fetchCurrentWeather() -> Weather? {
        guard let weatherData = weatherData else {
            return nil
        }

        let currentTemp = weatherData.current.temp
        let description: WeatherDescription

        if weatherData.current.snowfall > 0 {
            description = .snowy
        } else if weatherData.current.rain > 0 {
            description = .rainy
        } else {
            description = .sunny
        }
        
        let currentWeather = Weather(temperatur: currentTemp, weatherDescription: description , date: Date())
        return currentWeather
    }
    
    
    var today: DayWeather? {
        guard let weatherData = weatherData else { return nil }
        return DayWeather(
            date: weatherData.daily.time[0],
            maxTemp: weatherData.daily.tempMax[0],
            minTemp: weatherData.daily.tempMin[0],
            sunrise: weatherData.daily.sunrise[0],
            sunset: weatherData.daily.sunset[0],
            rainSum: weatherData.daily.rainSum[0],
            snowfallSum: weatherData.daily.snowfallSum[0],
            precipitationProbability: weatherData.daily.precipitationProbabilityMax[0]
        )
    }
    
    
    var tomorrow: DayWeather? {
        guard let weatherData = weatherData else { return nil }
        return DayWeather(
            date: weatherData.daily.time[1],
            maxTemp: weatherData.daily.tempMax[1],
            minTemp: weatherData.daily.tempMin[1],
            sunrise: weatherData.daily.sunrise[1],
            sunset: weatherData.daily.sunset[1],
            rainSum: weatherData.daily.rainSum[1],
            snowfallSum: weatherData.daily.rainSum[1],
            precipitationProbability: weatherData.daily.precipitationProbabilityMax[1]
        )
    }
    
    var allDays: [DayWeather] {
        guard let weatherData = weatherData else { return [] }
        return zip(0..<7, weatherData.daily.time).map { index, _ in
            DayWeather(
                date: weatherData.daily.time[index],
                maxTemp: weatherData.daily.tempMax[index],
                minTemp: weatherData.daily.tempMin[index],
                sunrise: weatherData.daily.sunrise[index],
                sunset: weatherData.daily.sunset[index],
                rainSum: weatherData.daily.rainSum[index],
                snowfallSum: weatherData.daily.snowfallSum[index],
                precipitationProbability: weatherData.daily.precipitationProbabilityMax[index]
            )
        }
    }
    
}
