//
//  WeatherViewModel.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 27.06.21.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject{
    static let instance = WeatherViewModel()
    //@Published var title = ""
    //@Published var icon = ""
    //@Published var bishTemp = ""
    //@Published var bishIcon = ""
    @AppStorage("bishkekTemp") var bishkekTemp = ""
    @AppStorage("bishkekIcon") var bishkekIcon = ""
    @AppStorage("bosteriTemp") var bosteriTemp = ""
    @AppStorage("bosteriIcon") var bosteriIcon = ""
    
    //api.openweathermap.org/data/2.5/weather?q=Bosteri&appid=12203a39a3f20b2e3d59ff3a6f23714b&units=metric
    func fetchWeather(_ city: String){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=12203a39a3f20b2e3d59ff3a6f23714b&units=metric") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let model = try? JSONDecoder().decode(WeatherModel.self, from: data)
            DispatchQueue.main.async {
                if city == "Bishkek"{
                    self.bishkekTemp = "\(Int(model?.main.temp ?? 0))"
                    self.bishkekIcon = model?.weather.first?.main ?? ""
                }else{
                    self.bosteriTemp = "\(Int(model?.main.temp ?? 0))"
                    self.bosteriIcon = model?.weather.first?.main ?? ""
                }
                
                //print("Data received")
            }
        }.resume()
    }
}
