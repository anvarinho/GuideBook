//
//  WeatherView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 27.06.21.
//

import SwiftUI

struct WeatherView: View {
    private let defaultIcon = "" //   "sparkles"
    private let iconMap = [
        "Drizzle" : "cloud.drizzle",
        "Thunderstorm" : "cloud.bolt.rain",
        "Rain" : "cloud.rain",
        "Snow" : "cloud.snow",
        "Clear" : "sun.min",
        "Clouds" : "cloud",
    ]
    @StateObject var vm = WeatherViewModel()
    var body: some View{
        HStack{
            Text(vm.title)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .shadow(color: .black, radius: 1, x: 1, y: 1)
            Image(systemName: iconMap[vm.icon] ?? defaultIcon)
                .resizable()
                .frame(width: 37, height: 37)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
        }.foregroundColor(.purple)
        .padding(.top, 7)
        .opacity(vm.bishTemp == "0" && vm.icon == "" ? 0 : 1)
    }
}

