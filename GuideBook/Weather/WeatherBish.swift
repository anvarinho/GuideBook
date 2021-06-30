//
//  WeatherBish.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 28.06.21.
//

import SwiftUI

struct WeatherBish: View {
    private let defaultIcon = "" //"sparkles"
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
            Text(vm.bishTemp)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .shadow(color: .black, radius: 1, x: 1, y: 1)
            Image(systemName: iconMap[vm.bishIcon] ?? defaultIcon)
                .resizable()
                .frame(width: 45, height: 45)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
        }.foregroundColor(.green)
        .opacity(vm.bishTemp == "0" && vm.icon == "" ? 0 : 1)
    }
}


