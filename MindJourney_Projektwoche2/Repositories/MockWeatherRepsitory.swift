////
////  MockWeatherRepsitory.swift
////  Test1
////
////  Created by Lars Nicodemus on 25.11.24.
////
//import Foundation
//
//
//
//class MockWeatherRepository: WeatherRepository {
//    func getWeatherData() async throws -> WeatherData {
//        return WeatherData(
//            latitude: 52.52,
//            longitude: 13.419998,
//            generationtime_ms: 0.3470182418823242,
//            utc_offset_seconds: 3600,
//            timezone: "Europe/Berlin",
//            timezone_abbreviation: "CET",
//            elevation: 38.0,
//            current_units: CurrentUnits(
//                time: "iso8601",
//                interval: "seconds",
//                temperature_2m: "°C",
//                apparent_temperature: "°C",
//                is_day: "",
//                rain: "mm",
//                showers: "mm",
//                snowfall: "cm"
//            ),
//            current: Current(
//                time: "2024-11-25T09:30",
//                interval: 900,
//                temperature_2m: 9.6,
//                apparent_temperature: 6.6,
//                is_day: 1,
//                rain: 0.00,
//                showers: 0.00,
//                snowfall: 0.00
//            ),
//            daily_units: DailyUnits(
//                time: "iso8601",
//                temperature_2m_max: "°C",
//                temperature_2m_min: "°C",
//                apparent_temperature_max: "°C",
//                apparent_temperature_min: "°C",
//                sunrise: "iso8601",
//                sunset: "iso8601",
//                daylight_duration: "s",
//                sunshine_duration: "s",
//                rain_sum: "mm",
//                showers_sum: "mm",
//                snowfall_sum: "cm",
//                precipitation_probability_max: "%"
//            ),
//            daily: Daily(
//                time: [
//                    "2024-11-25",
//                    "2024-11-26",
//                    "2024-11-27",
//                    "2024-11-28",
//                    "2024-11-29",
//                    "2024-11-30",
//                    "2024-12-01"
//                ],
//                temperature_2m_max: [12.1, 10.8, 7.1, 7.3, 5.7, 3.4, 2.5],
//                temperature_2m_min: [9.3, 6.0, 3.8, 4.7, 3.7, 0.9, 0.3],
//                apparent_temperature_max: [9.4, 8.7, 4.4, 5.6, 2.6, 1.0, -0.0],
//                apparent_temperature_min: [6.2, 3.7, 1.0, 1.5, 1.1, -1.8, -2.6],
//                sunrise: [
//                    "2024-11-25T07:46",
//                    "2024-11-26T07:47",
//                    "2024-11-27T07:49",
//                    "2024-11-28T07:50",
//                    "2024-11-29T07:52",
//                    "2024-11-30T07:53",
//                    "2024-12-01T07:55"
//                ],
//                sunset: [
//                    "2024-11-25T16:00",
//                    "2024-11-26T15:59",
//                    "2024-11-27T15:58",
//                    "2024-11-28T15:58",
//                    "2024-11-29T15:57",
//                    "2024-11-30T15:56",
//                    "2024-12-01T15:55"
//                ],
//                daylight_duration: [
//                    29673.07,
//                    29522.63,
//                    29378.05,
//                    29239.38,
//                    29105.06,
//                    28974.91,
//                    28849.12
//                ],
//                sunshine_duration: [
//                    8617.23,
//                    21689.12,
//                    22905.51,
//                    3249.59,
//                    16920.30,
//                    0.00,
//                    0.00
//                ],
//                rain_sum: [0.70, 3.20, 0.00, 5.20, 0.50, 0.00, 0.00],
//                showers_sum: [0.00, 0.10, 0.00, 0.10, 0.00, 0.00, 0.00],
//                snowfall_sum: [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],
//                precipitation_probability_max: [38, 90, 35, 78, 24, 0, 5]
//            )
//        )
//    }
//    
//    func getWeatherData(latitude: Double, longitude: Double) async throws -> WeatherData {
//        return WeatherData(
//            latitude: latitude,
//            longitude: longitude,
//            generationtime_ms: 0.3470182418823242,
//            utc_offset_seconds: 3600,
//            timezone: "Europe/Berlin",
//            timezone_abbreviation: "CET",
//            elevation: 38.0,
//            current_units: CurrentUnits(
//                time: "iso8601",
//                interval: "seconds",
//                temperature_2m: "°C",
//                apparent_temperature: "°C",
//                is_day: "",
//                rain: "mm",
//                showers: "mm",
//                snowfall: "cm"
//            ),
//            current: Current(
//                time: "2024-11-25T09:30",
//                interval: 900,
//                temperature_2m: 9.6,
//                apparent_temperature: 6.6,
//                is_day: 1,
//                rain: 0.00,
//                showers: 0.00,
//                snowfall: 0.00
//            ),
//            daily_units: DailyUnits(
//                time: "iso8601",
//                temperature_2m_max: "°C",
//                temperature_2m_min: "°C",
//                apparent_temperature_max: "°C",
//                apparent_temperature_min: "°C",
//                sunrise: "iso8601",
//                sunset: "iso8601",
//                daylight_duration: "s",
//                sunshine_duration: "s",
//                rain_sum: "mm",
//                showers_sum: "mm",
//                snowfall_sum: "cm",
//                precipitation_probability_max: "%"
//            ),
//            daily: Daily(
//                time: [
//                    "2024-11-25",
//                    "2024-11-26",
//                    "2024-11-27",
//                    "2024-11-28",
//                    "2024-11-29",
//                    "2024-11-30",
//                    "2024-12-01"
//                ],
//                temperature_2m_max: [12.1, 10.8, 7.1, 7.3, 5.7, 3.4, 2.5],
//                temperature_2m_min: [9.3, 6.0, 3.8, 4.7, 3.7, 0.9, 0.3],
//                apparent_temperature_max: [9.4, 8.7, 4.4, 5.6, 2.6, 1.0, -0.0],
//                apparent_temperature_min: [6.2, 3.7, 1.0, 1.5, 1.1, -1.8, -2.6],
//                sunrise: [
//                    "2024-11-25T07:46",
//                    "2024-11-26T07:47",
//                    "2024-11-27T07:49",
//                    "2024-11-28T07:50",
//                    "2024-11-29T07:52",
//                    "2024-11-30T07:53",
//                    "2024-12-01T07:55"
//                ],
//                sunset: [
//                    "2024-11-25T16:00",
//                    "2024-11-26T15:59",
//                    "2024-11-27T15:58",
//                    "2024-11-28T15:58",
//                    "2024-11-29T15:57",
//                    "2024-11-30T15:56",
//                    "2024-12-01T15:55"
//                ],
//                daylight_duration: [
//                    29673.07,
//                    29522.63,
//                    29378.05,
//                    29239.38,
//                    29105.06,
//                    28974.91,
//                    28849.12
//                ],
//                sunshine_duration: [
//                    8617.23,
//                    21689.12,
//                    22905.51,
//                    3249.59,
//                    16920.30,
//                    0.00,
//                    0.00
//                ],
//                rain_sum: [0.70, 3.20, 0.00, 5.20, 0.50, 0.00, 0.00],
//                showers_sum: [0.00, 0.10, 0.00, 0.10, 0.00, 0.00, 0.00],
//                snowfall_sum: [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],
//                precipitation_probability_max: [38, 90, 35, 78, 24, 0, 5]
//            )
//        )
//    }
//}
