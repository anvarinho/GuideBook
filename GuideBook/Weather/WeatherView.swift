//
//  WeatherView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 27.06.21.
//

import SwiftUI

struct WeatherView: View {
    private let defaultIcon = ""//   "sparkles"
    let city : String
    private let iconMap = [
        "Drizzle" : "cloud.drizzle",
        "Thunderstorm" : "cloud.bolt.rain",
        "Rain" : "cloud.rain",
        "Snow" : "cloud.snow",
        "Clear" : "sun.min",
        "Clouds" : "cloud",
    ]
    
    @AppStorage("bishkekTemp") var bishkekTemp = ""
    @AppStorage("bishkekIcon") var bishkekIcon = ""
    @AppStorage("bosteriTemp") var bosteriTemp = ""
    @AppStorage("bosteriIcon") var bosteriIcon = ""
    
    var temp: String{ city == "Bishkek" ? bishkekTemp : bosteriTemp }
    var icon: String{ city == "Bishkek" ? bishkekIcon : bosteriIcon }
    var body: some View{
        HStack{
            Text(temp)
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .shadow(color: .black, radius: 1, x: 1, y: 1)
            Image(systemName: iconMap[icon] ?? defaultIcon)
                .scaleEffect(1.6)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
        }.foregroundColor(city == "Bishkek" ? .green :.purple)
        .padding(.top, 7)
        .opacity(temp == "0" && icon == "" ? 0 : 1)
    }
}

