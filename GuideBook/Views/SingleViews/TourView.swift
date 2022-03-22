//
//  TourView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.09.2021.
//

import SwiftUI

struct TourView: View {
    var city: Tour
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
            
            VStack(alignment: .leading){
                HStack{
                    Text(city.name)
                    Spacer()
                    Text(city.price)
                }.font(.system(size: 19, weight: .bold, design: .rounded))
                .scaleEffect(showText ? 0 : 1)
                Spacer()
                Text(city.title)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
            }.foregroundColor(.white)
            .shadow(color: .black, radius: 3, x: 3, y: -3)
            .padding()
            
            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
        }.padding()
        .frame(width: width , height: width / 1.77)
        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
        
    }
}
