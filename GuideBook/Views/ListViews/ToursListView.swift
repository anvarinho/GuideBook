//
//  IKListView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct ToursListView: View {
    @EnvironmentObject var vm: ViewModel
    @State var animate = false
    @State var selectedModel: Tour?
    var body: some View {
        GeometryReader{ fullView in
            BackgroundView()
            ScrollView(.vertical, showsIndicators: false){
                ZStack{
                    VStack(alignment: .center, spacing: 12){
                        ForEach(vm.tours) { place in
                            GeometryReader{ geo in
                                TourView(city: place, showText: geo.frame(in: .global).minY > UIScreen.main.bounds.height / 4 * 3)
                                    .opacity(geo.frame(in: .global).minY > UIScreen.main.bounds.height / 4 * 3 ? 0.6 : 1)
                                    .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
                                    .onTapGesture {
                                        selectedModel = place
                                    }
                            }
                        }.frame(height: UIScreen.main.bounds.width / 1.93)
                        Spacer(minLength: 15)
                    }.padding(.vertical, 40)
                    .offset(y: animate ? 0 : UIScreen.main.bounds.height)
                    VStack{
                        HStack{
                            Button {
                                vm.showMap.toggle()
                            } label: {
                                MenuButton(title: "Maps", image: "maps")
                            }

                        }.padding(.horizontal)
                        .offset(y: animate ? 0 : -100)
                        Spacer()
                    }
                }
               
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.8)){
                        animate = true
                    }
                }
            }
        }.sheet(item: $selectedModel) { item in
           // PearlDescription(selectedPearl: item)
            TourDescription(tour: item)
        }
    }
}
