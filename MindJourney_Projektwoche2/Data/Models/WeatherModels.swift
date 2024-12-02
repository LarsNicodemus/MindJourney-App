//
//  WeatherModels.swift
//  Test1
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI

struct WeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let generationtime_ms: Double
    let utc_offset_seconds: Int
    let timezone: String
    let timezone_abbreviation: String
    let elevation: Double
    let current_units: CurrentUnits
    let current: Current
    let daily_units: DailyUnits
    let daily: Daily
}

struct CurrentUnits: Codable {
    let time: String
    let interval: String
    let temperature_2m: String
    let apparent_temperature: String
    let is_day: String
    let rain: String
    let showers: String
    let snowfall: String
}

struct Current: Codable {
    let time: String
    let interval: Int
    let temperature_2m: Double
    let apparent_temperature: Double
    let is_day: Int
    let rain: Double
    let showers: Double
    let snowfall: Double
}

struct DailyUnits: Codable {
    let time: String
    let temperature_2m_max: String
    let temperature_2m_min: String
    let apparent_temperature_max: String
    let apparent_temperature_min: String
    let sunrise: String
    let sunset: String
    let daylight_duration: String
    let sunshine_duration: String
    let rain_sum: String
    let showers_sum: String
    let snowfall_sum: String
    let precipitation_probability_max: String
}

struct Daily: Codable {
    let time: [String]
    let temperature_2m_max: [Double]
    let temperature_2m_min: [Double]
    let apparent_temperature_max: [Double]
    let apparent_temperature_min: [Double]
    let sunrise: [String]
    let sunset: [String]
    let daylight_duration: [Double]
    let sunshine_duration: [Double]
    let rain_sum: [Double]
    let showers_sum: [Double]
    let snowfall_sum: [Double]
    let precipitation_probability_max: [Int]
}

struct DayWeather: Identifiable {
    let id = UUID()
    let date: String
    let maxTemp: Double
    let minTemp: Double
    let sunrise: String
    let sunset: String
    let rainSum: Double
    let snowfallSum: Double
    let precipitationProbability: Int
    
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }
        return date
    }
}
