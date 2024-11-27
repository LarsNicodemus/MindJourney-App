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
import Foundation




class MockWeatherRepository: WeatherRepository {
    func getWeatherData() async throws -> WeatherData {
        return WeatherData(
            lat: 52.52,
            long: 13.419998,
            gsTime: 0.3470182418823242,
            offSec: 3600,
            timeZone: "Europe/Berlin",
            timeZoneAbb: "CET",
            elevation: 38.0,
            currUnits: CurrentUnits(
                time: "iso8601",
                interval: "seconds",
                temp: "°C",
                apparentTemp: "°C",
                isDay: "",
                rain: "mm",
                showers: "mm",
                snollfall: "cm"
            ),
            current: Current(
                time: "2024-11-25T09:30",
                interval: 900,
                temp: 9.6,
                apparentTemp: 6.6,
                isDay: 1,
                rain: 0.00,
                showers: 0.00,
                snowfall: 0.00
            ),
            dailyUnits: DailyUnits(
                time: "iso8601",
                tempMax: "°C",
                tempMin: "°C",
                apparentTempMax: "°C",
                apparentTempMin: "°C",
                sunrise: "iso8601",
                sunset: "iso8601",
                daylightDuration: "s",
                sunshineDuration: "s",
                rainSum: "mm",
                showerSum: "mm",
                snowfallSum: "cm",
                precipitationProbabilityMax: "%"
            ),
            daily: Daily(
                time: [
                    "2024-11-25",
                    "2024-11-26",
                    "2024-11-27",
                    "2024-11-28",
                    "2024-11-29",
                    "2024-11-30",
                    "2024-12-01"
                ],
                tempMax: [12.1, 10.8, 7.1, 7.3, 5.7, 3.4, 2.5],
                tempMin: [9.3, 6.0, 3.8, 4.7, 3.7, 0.9, 0.3],
                apparentTempMax: [9.4, 8.7, 4.4, 5.6, 2.6, 1.0, -0.0],
                apparentTempMin: [6.2, 3.7, 1.0, 1.5, 1.1, -1.8, -2.6],
                sunrise: [
                    "2024-11-25T07:46",
                    "2024-11-26T07:47",
                    "2024-11-27T07:49",
                    "2024-11-28T07:50",
                    "2024-11-29T07:52",
                    "2024-11-30T07:53",
                    "2024-12-01T07:55"
                ],
                sunset: [
                    "2024-11-25T16:00",
                    "2024-11-26T15:59",
                    "2024-11-27T15:58",
                    "2024-11-28T15:58",
                    "2024-11-29T15:57",
                    "2024-11-30T15:56",
                    "2024-12-01T15:55"
                ],
                daylightDuration: [
                    29673.07,
                    29522.63,
                    29378.05,
                    29239.38,
                    29105.06,
                    28974.91,
                    28849.12
                ],
                sunshineDuration: [
                    8617.23,
                    21689.12,
                    22905.51,
                    3249.59,
                    16920.30,
                    0.00,
                    0.00
                ],
                rainSum: [0.70, 3.20, 0.00, 5.20, 0.50, 0.00, 0.00],
                showerSum: [0.00, 0.10, 0.00, 0.10, 0.00, 0.00, 0.00],
                snowfallSum: [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],
                precipitationProbabilityMax: [38, 90, 35, 78, 24, 0, 5]
            )
        )
    }
    
    func getWeatherData(latitude: Double, longitude: Double) async throws -> WeatherData {
        return WeatherData(
            lat: latitude,
            long: longitude,
            gsTime: 0.3470182418823242,
            offSec: 3600,
            timeZone: "Europe/Berlin",
            timeZoneAbb: "CET",
            elevation: 38.0,
            currUnits: CurrentUnits(
                time: "iso8601",
                interval: "seconds",
                temp: "°C",
                apparentTemp: "°C",
                isDay: "",
                rain: "mm",
                showers: "mm",
                snollfall: "cm"
            ),
            current: Current(
                time: "2024-11-25T09:30",
                interval: 900,
                temp: 9.6,
                apparentTemp: 6.6,
                isDay: 1,
                rain: 0.00,
                showers: 0.00,
                snowfall: 0.00
            ),
            dailyUnits: DailyUnits(
                time: "iso8601",
                tempMax: "°C",
                tempMin: "°C",
                apparentTempMax: "°C",
                apparentTempMin: "°C",
                sunrise: "iso8601",
                sunset: "iso8601",
                daylightDuration: "s",
                sunshineDuration: "s",
                rainSum: "mm",
                showerSum: "mm",
                snowfallSum: "cm",
                precipitationProbabilityMax: "%"
            ),
            daily: Daily(
                time: [
                    "2024-11-25",
                    "2024-11-26",
                    "2024-11-27",
                    "2024-11-28",
                    "2024-11-29",
                    "2024-11-30",
                    "2024-12-01"
                ],
                tempMax: [12.1, 10.8, 7.1, 7.3, 5.7, 3.4, 2.5],
                tempMin: [9.3, 6.0, 3.8, 4.7, 3.7, 0.9, 0.3],
                apparentTempMax: [9.4, 8.7, 4.4, 5.6, 2.6, 1.0, -0.0],
                apparentTempMin: [6.2, 3.7, 1.0, 1.5, 1.1, -1.8, -2.6],
                sunrise: [
                    "2024-11-25T07:46",
                    "2024-11-26T07:47",
                    "2024-11-27T07:49",
                    "2024-11-28T07:50",
                    "2024-11-29T07:52",
                    "2024-11-30T07:53",
                    "2024-12-01T07:55"
                ],
                sunset: [
                    "2024-11-25T16:00",
                    "2024-11-26T15:59",
                    "2024-11-27T15:58",
                    "2024-11-28T15:58",
                    "2024-11-29T15:57",
                    "2024-11-30T15:56",
                    "2024-12-01T15:55"
                ],
                daylightDuration: [
                    29673.07,
                    29522.63,
                    29378.05,
                    29239.38,
                    29105.06,
                    28974.91,
                    28849.12
                ],
                sunshineDuration: [
                    8617.23,
                    21689.12,
                    22905.51,
                    3249.59,
                    16920.30,
                    0.00,
                    0.00
                ],
                rainSum: [0.70, 3.20, 0.00, 5.20, 0.50, 0.00, 0.00],
                showerSum: [0.00, 0.10, 0.00, 0.10, 0.00, 0.00, 0.00],
                snowfallSum: [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],
                precipitationProbabilityMax: [38, 90, 35, 78, 24, 0, 5]
            )
        )
    }
}

