//
//  PearlView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct PearlView: View {
    var city: Pearl
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
                        if city.id == 313{
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
                    .scaleEffect(showText ? 0 : 1)
            }.foregroundColor(.white)
            .shadow(color: .black, radius: 3, x: 3, y: -3)
            .padding()
            
            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
        }.padding()
        .frame(width: width , height: width / 1.77)
        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
        
    }
}

