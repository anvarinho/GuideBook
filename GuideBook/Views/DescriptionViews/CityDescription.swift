//
//  CityDescription.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//
import SwiftUI

struct CityDescription: View{
    var selectedCity: City
    @AppStorage("background") var background = 0
    @EnvironmentObject var vm: ViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var width =  UIScreen.main.bounds.width
    @State var selectedSight: Sight? = nil
    
    var text = ""
    var body: some View{
        ZStack{
            BackgroundView()
            ScrollView {
                VStack{
                    Image(selectedCity.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width , height: width / 1.77)
                        .cornerRadius(5)
                    Text(selectedCity.name.capitalized)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(BackgroundView().getFontColor(num: background))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(selectedCity.sights){ sight in
                                ZStack {
                                    Image(sight.photo)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    VStack {
                                        Spacer()
                                        Text(sight.name)
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                            .padding(5)
                                            .shadow(color: .black, radius: 1, x: 1, y: 1)
                                    }
                                    VStack{
                                        HStack{
                                            Spacer()
                                            Image("map")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 30, height: 30)
                                                .padding(5)
                                                .background(BlurView(style: .systemUltraThinMaterial))
                                                .cornerRadius(5)
                                                .onTapGesture {
                                                    UIApplication.shared.open(URL(string: "https://maps.apple.com/?ll=\(sight.location.latitude),\(sight.location.longitude)")!)
                                                }
                                        }
                                        Spacer()
                                    }.padding(7)
                                }.frame(width: 180,height: 120)
                                .cornerRadius(5)
                                .onTapGesture {
                                    selectedSight = sight
                                }
                            }
                        }.id(UUID())
                        .padding(.horizontal, 5)
                    }
                    
                    Text(selectedCity.description)
                        .padding(.horizontal)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(BackgroundView().getFontColor(num: background))
                    
                }
                ContactButton()
                Link(destination: URL(string: "https://maps.apple.com/?ll=\(selectedCity.location.latitude),\(selectedCity.location.longitude)")!, label: {
                    MenuButtonLabel(title: "Show on Maps", image: "map")
                }).padding(.horizontal)
                
            }.sheet(item: $selectedSight) { item in
                SightView(sight: item)
            }

            DismissButton()
        }
    }
}


