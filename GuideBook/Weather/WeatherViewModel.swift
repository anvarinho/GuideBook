//
//  WeatherViewModel.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 27.06.21.
//

import Foundation

class WeatherViewModel: ObservableObject{
    @Published var title = ""
    @Published var icon = ""
    @Published var bishTemp = ""
    @Published var bishIcon = ""
    
    init() {
        fetchWeatherBish()
        fetchWeather()
    }
    
    //api.openweathermap.org/data/2.5/weather?q=Bosteri&appid=12203a39a3f20b2e3d59ff3a6f23714b&units=metric
    func fetchWeather(){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Bosteri&appid=12203a39a3f20b2e3d59ff3a6f23714b&units=metric") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let model = try? JSONDecoder().decode(WeatherModel.self, from: data)
            DispatchQueue.main.async {
                self.title = "\(Int(model?.main.temp ?? 0))"
                self.icon = model?.weather.first?.main ?? ""
                print("Data received")
            }
        }.resume()
    }
    func fetchWeatherBish(){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Bishkek&appid=12203a39a3f20b2e3d59ff3a6f23714b&units=metric") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let model = try? JSONDecoder().decode(WeatherModel.self, from: data)
            DispatchQueue.main.async {
                self.bishTemp = "\(Int(model?.main.temp ?? 0))"
                self.bishIcon = model?.weather.first?.main ?? ""
                print("Data received")
            }
        }.resume()
    }
}
