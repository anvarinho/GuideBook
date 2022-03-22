//
//  PearlCategories.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.09.2021.
//

import SwiftUI

struct PearlCategories: View {
    @StateObject var vm: ViewModel
    @AppStorage("selectedRegion") var selectedRegion = 0
    @AppStorage("categoryTitle") var categoryTitle = "All"
    
    var body: some View{
        VStack{
            HStack{
                Text(categoryTitle)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 8)
                    .background(BlurView(style: .systemThinMaterialDark))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            withAnimation {
                                selectedRegion = 0
                                categoryTitle = "All"
                                regions(num: selectedRegion)
                            }
                        }, label: {
                            Text("All")
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedRegion = 1
                                categoryTitle = "Chuy"
                                regions(num: selectedRegion)
                            }
                        }, label: {
                            Text("Chuy")
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedRegion = 2
                                categoryTitle = "Issyk-Kul"
                                regions(num: selectedRegion)
                            }
                        }, label: {
                            Text("Issyk-Kul")
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedRegion = 3
                                categoryTitle = "Naryn"
                                regions(num: selectedRegion)
                            }
                        }, label: {
                            Text("Naryn")
                        })
                        
                        Button(action: {
                            withAnimation {
                                selectedRegion = 4
                                categoryTitle = "Other"
                                regions(num: selectedRegion)
                            }
                        }, label: {
                            Text("Other")
                        })
                    }))
                
                Spacer()
            }.padding(.horizontal)
            Spacer()
        }.onAppear{
            regions(num: selectedRegion)
        }

    }
    func regions(num: Int){
        let chuy = [201, 205, 304, 302, 315, 316, 317, 303, 321]
        let isKul = [313, 308, 3, 403, 310, 312, 314, 311, 501, 402, 324, 325, 326, 318]
        let naryn = [1,202,306,319,320,323,401]
        let jalal = [9, 10, 301, 307, 322, 203, 309, 204]
        vm.selectedPearls = []
        if num == 0{
            vm.selectedPearls = vm.pearls
        }else{
            if num == 1{
                for i in vm.pearls{
                    for index in chuy.indices{
                        if i.id == chuy[index]{
                            vm.selectedPearls.append(i)
                        }
                    }
                }
            }else if num == 2{
                for i in vm.pearls{
                    for index in isKul.indices{
                        if i.id == isKul[index]{
                            vm.selectedPearls.append(i)
                        }
                    }
                }
            }else if num == 3{
                for i in vm.pearls{
                    for index in naryn.indices{
                        if i.id == naryn[index]{
                            vm.selectedPearls.append(i)
                        }
                    }
                }
            }else{
                for i in vm.pearls{
                    for index in jalal.indices{
                        if i.id == jalal[index]{
                            vm.selectedPearls.append(i)
                        }
                    }
                }
            }
        }
    }
}
