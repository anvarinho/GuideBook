//
//  ViewModel.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation

class ViewModel: ObservableObject {
    //@Published var mapData = MapViewModel()
    @Published var places = [City]()
    @Published var pearls = [Pearl]()
    @Published var tours = [Tour]()
    @Published var locations = [Location]()
    @Published var showMap = false
    @Published var showInfo = false
    @Published var showAboutCountry = false
    @Published var showAboutVisa = false
    @Published var showGuideView = false
    @Published var showColors = false
    @Published var selectedPearls: [Pearl] = []
    
  //  @Published var selectedTour: Tour? = nil
    
    init() {
        getData()
        getData2()
        getData3()
        getLocations()
        
    }
    func getData(){
        if let url = Bundle.main.url(forResource: "dataJson", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let decode = try? JSONDecoder().decode(Cities.self, from: data){
                self.places = decode.cities
            }
        }
    }
    func getData2(){
        if let url = Bundle.main.url(forResource: "dataJson", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let decode = try? JSONDecoder().decode(Pearls.self, from: data){
                self.pearls = decode.pearls
            }
        }
    }
 
    func getData3(){
        if let url = Bundle.main.url(forResource: "dataJson", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let decode = try? JSONDecoder().decode(Tours.self, from: data){
                self.tours = decode.tours
            }
        }
    }
    
    func getLocations(){
        for place in places{
            locations.append(place.location)
        }
    }
}
