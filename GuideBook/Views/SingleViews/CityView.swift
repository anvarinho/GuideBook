//
//  CityView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct CityView: View {
    var city: City
    var width = UIScreen.main.bounds.width
    var showText = false
    var body: some View {
        ZStack(alignment: .leading){
            Image(city.photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(5)
                .scaleEffect(showText ? 0.8 : 1)
                .offset(y: showText ? 40 : 0)
            VStack{
                 HStack{
                    VStack(alignment: .leading){
                        if city.id == 0{
                            WeatherView(city: "Bishkek")
                                .padding(.leading, 15)
                        }else if city.id == 7{
                            WeatherView(city: "Bosteri")
                                .padding(.leading, 15)
                        }
                    }
                     Spacer()
                 }
                 Spacer()
             }
            VStack(alignment: .leading){
                Spacer()
                
                Text(city.name.capitalized)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .offset(x: showText ? UIScreen.main.bounds.width : 0)
                Text(city.title)
                    .font(.system(size: 13, weight: .bold, design: .rounded))
                    .offset(x: showText ? -UIScreen.main.bounds.width : 0)
                   
            }.foregroundColor(.white)
            .shadow(color: .black, radius: 3, x: 3, y: -3)
            .padding()
            
            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
            HStack(alignment: .center){
                Spacer()
                Image(systemName: city.offset == 0 ? "chevron.compact.left" : "chevron.compact.right")
                    .scaleEffect(2.4)
                    .offset(y: 10)
                    .foregroundColor(.black)
                    .opacity(0.6)
            }.padding(.horizontal)
        }.padding()
        
        .frame(width: width , height: width / 1.77)
        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
    }
    
}

