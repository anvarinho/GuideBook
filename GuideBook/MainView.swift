//
//  ContentView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var vm: ViewModel
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var animate = false
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabBar()
            VStack{
                HStack{
                    Spacer()
                    Button {
                        vm.showInfo.toggle()
                    } label: {
                        MenuButton(title: "Menu", image: "menu")
                    }
                }.padding(.horizontal)
                .offset(y: animate ? 0 : -100)
                Spacer()
            }
            if vm.showInfo{
                MenuView()
                    .transition(.opacity)
            }
            if vm.showMap{
                MapView()
                    .transition(.opacity)
            }
        }.onAppear(perform: weatherAndAnimation)
    }
    func weatherAndAnimation() {
        WeatherViewModel.instance.fetchWeather("Bishkek")
        WeatherViewModel.instance.fetchWeather("Bosteri")
        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)){
            animate = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
