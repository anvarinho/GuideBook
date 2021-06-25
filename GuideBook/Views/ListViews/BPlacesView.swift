//
//  BPlacesView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct BPlacesView: View {
    @EnvironmentObject var vm: ViewModel
    @State var selectedPearl: Pearl?
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 10){
                ForEach(vm.pearls, id: \.id){ pearl in
                    Button(action: {
                        selectedPearl = pearl
                    }, label: {
                        PearlView(pearl: pearl)
                    })
                    
                }
            }.padding(.horizontal)
            .sheet(item: $selectedPearl) { item in
                PearlDescription(selectedPearl: item)
            }
        }
    }
}
