//
//  WeatherRepository.swift
//  Test1
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI



class RealWeatherRepository: WeatherRepository {
    private let baseURL = "https://api.open-meteo.com/v1/forecast"
    private let defaultLatitude = 52.52
    private let defaultLongitude = 13.419998
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func getWeatherData() async throws -> WeatherData {
        try await getWeatherData(latitude: defaultLatitude, longitude: defaultLongitude)
    }
    
    func getWeatherData(latitude: Double, longitude: Double) async throws -> WeatherData {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw WeatherAPIError.invalidURL
        }
        
        // Parameter für die API
        let queryItems = [
            URLQueryItem(name: "latitude", value: String(latitude)),
            URLQueryItem(name: "longitude", value: String(longitude)),
            URLQueryItem(name: "current", value: "temperature_2m,apparent_temperature,is_day,rain,showers,snowfall"),
            URLQueryItem(name: "daily", value: "temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,daylight_duration,sunshine_duration,rain_sum,showers_sum,snowfall_sum,precipitation_probability_max"),
            URLQueryItem(name: "timezone", value: "auto")
        ]
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw WeatherAPIError.invalidURL
        }
        
        do {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw WeatherAPIError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            do {
                return try decoder.decode(WeatherData.self, from: data)
            } catch {
                throw WeatherAPIError.decodingError(error)
            }
        } catch {
            if error is WeatherAPIError {
                throw error
            }
            throw WeatherAPIError.networkError(error)
        }
    }
}
