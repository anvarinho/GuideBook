//
//  PearlView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct PearlView: View {
    var pearl: Pearl
    var side: CGFloat{
        if UIScreen.main.bounds.height/UIScreen.main.bounds.width < 1.6{
            return UIScreen.main.bounds.width * 0.48
        }else{
            return UIScreen.main.bounds.width * 0.7
        }
    }
    var body: some View {
        ZStack{
            Image(pearl.photo)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.orange))
                .padding(2)
           VStack{
                HStack{
                    if pearl.id == 313{
                        WeatherView(city: "Bosteri")
                            .padding(.top)
                            .padding(.leading)
                        
                    }
                    Spacer()
                }
                Spacer()
            }
            VStack{
                Text(pearl.name.capitalized)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.orange)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                    .padding(5)
                    .background(BackgroundView()).opacity(0.8)
                    .blur(radius: 0.4)
                    .cornerRadius(8)
                    .offset(y: side / 5)
            }
        }.frame(maxWidth: side)
        .shadow(color: Color.black.opacity(0.6), radius: 5, x: 5, y: 5)
    }
}
