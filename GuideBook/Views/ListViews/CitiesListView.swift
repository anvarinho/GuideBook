//
//  CitiesListView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct CitiesListView: View {
    @EnvironmentObject var vm: ViewModel
    @State var animate = false
    @State var selectedModel: City?
    @GestureState var isDragging = false
    var body: some View {
        GeometryReader{ fullView in
            BackgroundView()
            ScrollView(.vertical, showsIndicators: false){
                ZStack{
                    VStack(alignment: .center, spacing: 12){
                        ForEach(vm.places.indices) { index in
                            GeometryReader{ geo in
                                ZStack {
                                    MapsButton(location: vm.places[index].location)
                                        .opacity(vm.places[index].offset == 0 || geo.frame(in: .global).minY > UIScreen.main.bounds.height / 4 * 3 ? 0 : 1)
                                       
                                    CityView(city: vm.places[index], showText: geo.frame(in: .global).minY > UIScreen.main.bounds.height / 4 * 3)
                                        .opacity(geo.frame(in: .global).minY > UIScreen.main.bounds.height / 4 * 3 ? 0.6 : 1)
                                        .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
                                        .offset(x: vm.places[index].offset)
                                        .gesture(DragGesture()
                                                    .updating($isDragging, body: { value, state, _ in
                                                        state = true
                                                        onChanged(value: value, index: index)
                                                    })
                                                    .onEnded({ value in
                                                        onEnd(value: value, index: index)
                                                    }))
                                        
                                        .onTapGesture {
                                            selectedModel = vm.places[index]
                                    }
                                }
                            }
                        }.frame(height: UIScreen.main.bounds.width / 1.93)
                        Spacer(minLength: 15)
                    }.padding(.vertical, 40)
                    VStack{
                        HStack{
                            BishkekTime()
                        }
                        Spacer()
                    }
                }
                
            }.offset(y: animate ? 0 : UIScreen.main.bounds.height)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.8)){
                        animate = true
                    }
                }
            }
        }.sheet(item: $selectedModel) { item in
            CityDescription(selectedCity: item)
        }
    }
    func onChanged(value: DragGesture.Value,index: Int){
        if value.translation.width < 0 && isDragging{
            vm.places[index].offset = value.translation.width
        }
    }
    func onEnd(value: DragGesture.Value,index: Int){
        withAnimation {
            if -value.translation.width >= 80{
                vm.places[index].offset = -80
            }else{
                vm.places[index].offset = 0
            }
        }
    }
    
}
