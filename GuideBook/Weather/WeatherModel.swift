//
//  WeatherModel.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 27.06.21.
//

import Foundation

struct WeatherModel: Codable {
    let weather: [WeatherInfo]
    let main: MainWeather
}

struct MainWeather: Codable {
    let temp: Double
}

struct WeatherInfo: Codable {
    let main: String
}
