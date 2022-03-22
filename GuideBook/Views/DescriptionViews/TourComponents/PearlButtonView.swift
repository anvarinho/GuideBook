//
//  PearlButtonView.swift
//  GuideBook
//
//  Created by MacBook on 25.01.2022.
//

import SwiftUI
import MapKit

struct PearlButtonView: View {
    @Binding var place: Pearl?
    var ids: [Int]
    var pearls: [Pearl]
    var body: some View {
        ForEach(ids, id: \.self) { id in
            ForEach(pearls) { pearl in
                if pearl.id == id{
                    Button{
                        place = pearl
                    } label: {
                        Text("\(pearl.name)")
                            .font(.system(size: 19, weight: .bold, design: .rounded))
                            .padding(5)
                            .foregroundColor(.primary)
                            .background(BlurView(style: .systemUltraThinMaterialDark))
                            .cornerRadius(5)
                    }
                }
            }
        }
    }
}
/*HStack{
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
}*/
