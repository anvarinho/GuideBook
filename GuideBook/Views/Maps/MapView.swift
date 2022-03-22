//
//  MapView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State var animate = false
    
    @State var locationManager = CLLocationManager()
    
    @State private var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.20, longitude: 74.76), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    @State var selectedModel: Pearl?
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $coordinateRegion, annotationItems: vm.pearls) { place in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.location.latitude, longitude: place.location.longitude)){
                    VStack{
                        Text(place.name.capitalized)
                            .font(.caption2)
                            .bold()
                        if place.id > 500{
                            Image(systemName: "staroflife")
                                .font(.title2)
                                .foregroundColor(.red)
                        }else if place.id > 400 && place.id < 499{
                            Image(systemName: "text.aligncenter")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }else if place.id > 300 && place.id < 399{
                            Image(systemName: "leaf")
                                .font(.title2)
                                .foregroundColor(.green)
                        }else if place.id > 200 && place.id < 299{
                            Image(systemName: "building.columns")
                                .font(.title2)
                                .foregroundColor(Color(#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)))
                        }else{
                            Image(systemName: "star")
                                .font(.title2)
                                .foregroundColor(.red)
                        }
                    }.onTapGesture {
                        selectedModel = place
                    }
                }
            }.ignoresSafeArea()
            VStack {
                HStack {
                    Button(action:{
                        vm.showMap.toggle()
                    }, label:{
                        MenuButton(title: "Back", image: "city")
                    })
                    Spacer()
                }.padding(.horizontal)
                .offset(y: animate ? 0 : -100)
                Spacer()
            }
        }.onAppear{
            withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)){
                animate = true
            }
        }.sheet(item: $selectedModel) { item in
            PearlDescription(selectedPearl: item)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
