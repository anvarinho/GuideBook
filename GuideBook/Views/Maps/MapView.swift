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
    
    @State var locationManager = CLLocationManager()
    
    @State private var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.20, longitude: 74.76), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    var body: some View {
        ZStack {
            
            
            Map(coordinateRegion: $coordinateRegion, annotationItems: vm.getSumPearls()) { place in
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
                    }
                }
            }.ignoresSafeArea()
            VStack {
                HStack{
                    Button(action: {
                        withAnimation{
                            vm.showMap.toggle()
                        }
                    }, label: {
                        NavigationButton(text: "Back")
                    })
                    Spacer()
                }.padding(.horizontal)
                Spacer()
            }        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
