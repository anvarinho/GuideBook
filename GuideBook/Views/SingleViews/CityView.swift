//
//  CityView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct CityView: View {
    var city: City
    var side: CGFloat{
        if UIScreen.main.bounds.height/UIScreen.main.bounds.width < 1.6{
            return UIScreen.main.bounds.width * 0.54
        }else{
            return UIScreen.main.bounds.width * 0.9
        }
    }
    var body: some View {
        
        ZStack(alignment: .bottom){
            Image(city.photo)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.orange))
                .frame(maxWidth: side)
            VStack{
                VStack{
                    Text(city.name.capitalized)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.orange)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                    Text(city.description.capitalized)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.orange)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                }
                .padding(.horizontal)
                .background(BackgroundView()).opacity(0.8)
                .blur(radius: 0.4)
                .cornerRadius(8)
                //.offset(y: side / 7)
                .frame(maxWidth: side * 0.8)
                .padding(.bottom, 5)
                
            }
        }
        .shadow(color: Color.black.opacity(0.6), radius: 4, x: 4, y: 4)
        .padding(.vertical, 8)
    }
}

