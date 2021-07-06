//
//  CityDescription.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation

import SwiftUI

struct CityDescription: View{
    var selectedCity: City
    @EnvironmentObject var vm: ViewModel
    @Environment(\.presentationMode) var presentationMode
    var text = ""
    var body: some View{
        ZStack{
            BackgroundView()
            ScrollView {
                VStack{
                    Image(selectedCity.photo)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1))))
                        .shadow(color: Color.black.opacity(0.6), radius: 4, x: 4, y: 4)
                    Text(selectedCity.name.capitalized)
                        .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .shadow(color: .black, radius: 3, x: 3, y: 3)
                        
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(selectedCity.sights){ sight in
                                ZStack {
                                    Image(sight.photo)
                                        .resizable()
                                        .scaledToFill()
                                        
                                    VStack {
                                        Spacer()
                                        Text(sight.name)
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                                            .shadow(color: .black, radius: 1, x: 1, y: 1)
                                            .padding(5)
                                            .background(
                                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1098039216, green: 0.462745098, blue: 0.5607843137, alpha: 1)), Color(#colorLiteral(red: 0.01176470588, green: 0.1450980392, blue: 0.2235294118, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.8)
                                            )
                                            .blur(radius: 0.4)
                                            .cornerRadius(8)
                                            .padding(.bottom, 3)
                                    }
                                }.frame(width: 180,height: 120)
                                .cornerRadius(12)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.orange))
                                .shadow(color: Color.black.opacity(0.6), radius: 3, x: 3, y: 3)
                                .padding(7)
                            }
                        }.id(UUID())
                        .padding(.horizontal, 5)
                    }
                    
                    Text(vm.getDescription(selectedCity.name))
                        .padding()
                        .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                    
                }
            }
            DismissButton()
        }
    }
}
