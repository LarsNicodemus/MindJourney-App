//
//  WeatherModels.swift
//  Test1
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI

struct WeatherData: Codable {
    let lat: Double
    let long: Double
    let gsTime: Double
    let offSec: Int
    let timeZone: String
    let timeZoneAbb: String
    let elevation: Double
    let currUnits: CurrentUnits
    let current: Current
    let dailyUnits: DailyUnits
    let daily: Daily

    enum CodingKeys: String, CodingKey {
        case lat = "latitude"
        case long = "longitude"
        case gsTime = "generationtime_ms"
        case offSec = "utc_offset_secon"
        case timeZone = "timezone"
        case timeZoneAbb = "timezone_abbreviation"
        case elevation = "elevation"
        case currUnits = "current_units"
        case current = "current"
        case dailyUnits = "daily_units"
        case daily = "daily"
    }
}

struct CurrentUnits: Codable {
    let time: String
    let interval: String
    let temp: String
    let apparentTemp: String
    let isDay: String
    let rain: String
    let showers: String
    let snollfall: String

    enum CodingKeys: String, CodingKey {
        case time = "time"
        case interval = "interval"
        case temp = "temperature_2m"
        case apparentTemp = "apparent_temperature"
        case isDay = "is_day"
        case rain = "rain"
        case showers = "showers"
        case snollfall = "snowfall"
    }
}

struct Current: Codable {
    let time: String
    let interval: Int
    let temp: Double
    let apparentTemp: Double
    let isDay: Int
    let rain: Double
    let showers: Double
    let snowfall: Double

    enum CodingKeys: String, CodingKey {
        case time = "time"
        case interval = "interval"
        case temp = "temperature_2m"
        case apparentTemp = "apparent_temperature"
        case isDay = "is_day"
        case rain = "rain"
        case showers = "showers"
        case snowfall = "snowfall"

    }
}

struct DailyUnits: Codable {
    let time: String
    let tempMax: String
    let tempMin: String
    let apparentTempMax: String
    let apparentTempMin: String
    let sunrise: String
    let sunset: String
    let daylightDuration: String
    let sunshineDuration: String
    let rainSum: String
    let showerSum: String
    let snowfallSum: String
    let precipitationProbabilityMax: String

    enum CodingKeys: String, CodingKey {
        case time = "time"
        case tempMax = "temperature_2m_max"
        case tempMin = "temperature_2m_min"
        case apparentTempMax = "apparent_temperature_max"
        case apparentTempMin = "apparent_temperature_min"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case daylightDuration = "daylight_duration"
        case sunshineDuration = "sunshine_duration"
        case rainSum = "rain_sum"
        case showerSum = "showers_sum"
        case snowfallSum = "snowfall_sum"
        case precipitationProbabilityMax = "precipitation_probability_max"
    }
}

struct Daily: Codable {
    let time: [String]
    let tempMax: [Double]
    let tempMin: [Double]
    let apparentTempMax: [Double]
    let apparentTempMin: [Double]
    let sunrise: [String]
    let sunset: [String]
    let daylightDuration: [Double]
    let sunshineDuration: [Double]
    let rainSum: [Double]
    let showerSum: [Double]
    let snowfallSum: [Double]
    let precipitationProbabilityMax: [Int]

    enum CodingKeys: String, CodingKey {
        case time = "time"
        case tempMax = "temperature_2m_max"
        case tempMin = "temperature_2m_min"
        case apparentTempMax = "apparent_temperature_max"
        case apparentTempMin = "apparent_temperature_min"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case daylightDuration = "daylight_duration"
        case sunshineDuration = "sunshine_duration"
        case rainSum = "rain_sum"
        case showerSum = "showers_sum"
        case snowfallSum = "snowfall_sum"
        case precipitationProbabilityMax = "precipitation_probability_max"
    }
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
