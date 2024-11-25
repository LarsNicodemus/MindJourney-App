//
//  Protocols.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI

protocol WeatherRepository {
    func getWeatherData() async throws -> WeatherData
    func getWeatherData(latitude: Double, longitude: Double) async throws -> WeatherData
}
