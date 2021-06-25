//
//  CitiesListView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct CitiesListView: View {
    @EnvironmentObject var vm: ViewModel
    @State var selectedModel: City?
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 10){
                ForEach(vm.places, id: \.id){ place in
                    
                    Button(action: {
                        selectedModel = place
                    }, label: {
                        CityView(city: place)
                    })
                }
            }.padding(.horizontal)
            .sheet(item: $selectedModel) { item in
                CityDescription(selectedCity: item)
            }
        }
    }
}
