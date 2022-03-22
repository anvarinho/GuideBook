//
//  WeatherView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 27.06.21.
//

import SwiftUI

struct WeatherView: View {
    private let defaultIcon = "thermometer"//   "sparkles"
    let city : String
    private let iconMap = [
        "Drizzle" : "cloud.drizzle.fill",
        "Thunderstorm" : "cloud.bolt.rain.fill",
        "Rain" : "cloud.rain.fill",
        "Snow" : "cloud.snow.fill",
        "Clear" : "sun.max.fill",
        "Clouds" : "cloud.sun.fill",
    ]
    
    @AppStorage("bishkekTemp") var bishkekTemp = ""
    @AppStorage("bishkekIcon") var bishkekIcon = ""
    @AppStorage("bosteriTemp") var bosteriTemp = ""
    @AppStorage("bosteriIcon") var bosteriIcon = ""
    @State var animate = false
    
    var temp: String{ city == "Bishkek" ? bishkekTemp : bosteriTemp }
    var icon: String{ city == "Bishkek" ? bishkekIcon : bosteriIcon }
    var body: some View{
        HStack{
            Text("\(temp)°C")
            Image(systemName: iconMap[icon] ?? defaultIcon)
                .renderingMode(.original)
        }.foregroundColor(.white)
        .font(.system(size: 45, weight: .regular, design: .rounded))
        .shadow(color: .black, radius: 1, x: 1, y: 1)
        .padding(.top, 7)
        .opacity(temp == "0" && icon == "" ? 0 : 1)
        .animation(.spring())
        .scaleEffect(animate ? 1 : 0)
        .opacity(animate ? 1 : 0)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.8)){
                    animate = true
                }
            }
        }
    }
}
