//
//  TourDescription.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.09.2021.
//

import SwiftUI

struct TourDescription: View {
    @EnvironmentObject var vm: ViewModel
    @State var tour: Tour
    @State var animate: Bool = false
    @State var selectedCity: City?
    @State var selectedPearl: Pearl?
    var body: some View {
        
        ZStack {
            BlurView(style: .systemThinMaterialDark).ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false){
                TextAnimation(word: tour.title)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .padding(.top, 17)
                ForEach(tour.days) { day in
                    
                    VStack{
                        if day.id < 20{
                            ListOfPictures(tour: day.photo)
                        }
                        VStack(alignment: .leading){
                            Text(day.name)
                                .font(.system(size: 21, weight: .bold, design: .rounded))
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    PearlButtonView(place: $selectedPearl, ids: day.pearls, pearls: vm.pearls)
                                    CitiesButtonView(place: $selectedCity, ids: day.cities , cities: vm.places)
                                }
                            }
                            
                            TourActionsView(actions: day.action)
                            
                        }.padding(5)
                            .frame(width: UIScreen.main.bounds.width * 0.96)
                            .background(BlurView(style: .systemUltraThinMaterial))
                            .cornerRadius(5)
                            .padding()
                        CustomDivider()
                    }
                }
                ContactButton()
            }.sheet(item: $selectedCity) { item in
                CityDescription(selectedCity: item)
            }.sheet(item: $selectedPearl) { item in
                PearlDescription(selectedPearl: item)
            }
            DismissButton()
        }.onAppear{
            selectedCity = nil
            selectedPearl = nil
        }
        /*ZStack{
            BlurView(style: .systemThinMaterialDark).ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false){
                Text(tour.title)
               // TextAnimation(word: tour.title)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .padding(.top, 17)
                ForEach(tour.days) { day in
                        VStack {
                            if day.id < 20 {
                                ListOfPictures(tour: day.photo)
                            }
                            VStack(alignment: .leading) {
                                Text(day.name)
                                    .font(.system(size: 21, weight: .bold, design: .rounded))
                                HStack{
                                    ForEach(day.pearls, id: \.self){ id in
                                        ForEach(vm.pearls) { pearl in
                                            if pearl.id == id{
                                                Text("\(pearl.name)")
                                                    .font(.system(size: 19, weight: .bold, design: .rounded))
                                                    .padding(5)
                                                    .background(BlurView(style: .systemUltraThinMaterialDark))
                                                    .cornerRadius(5)
                                                    .onTapGesture{
                                                        selectedPearl = pearl
                                                    }
                                            }
                                        }
                                    }
                                }
                                
                                ForEach(day.action) { text in
                                    Text("\(text.name).")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                }
                                
                                
                            }.padding(5)
                            .frame(width: UIScreen.main.bounds.width * 0.96)
                            .background(BlurView(style: .systemUltraThinMaterial))
                            .cornerRadius(5)
                            .padding()
                            
                             CustomDivider()
                                
                        }
                }.sheet(item: $selectedCity) { item in
                    CityDescription(selectedCity: item)
                }.sheet(item: $selectedPearl) { item in
                    PearlDescription(selectedPearl: item)
                }
               // ContactButton()
            }//.offset(y: animate ? 0 : 800)
            
          //  DismissButton()
        }//.onAppear(perform: animation)
         */
    }
}
