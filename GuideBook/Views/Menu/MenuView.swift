//
//  MenuView.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @State var animate = [false, false, false, false]
    @State var showSheet = false
    @State var showActionSheet = false
    @EnvironmentObject var vm: ViewModel
    
    var isPad: Bool{ return UIDevice.current.userInterfaceIdiom == .pad }
    
    var body: some View {
        ZStack{
            BlurView(style: .systemThinMaterialDark).ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(action:{
                        vm.showInfo.toggle()
                    }, label:{
                        NavigationButton(text: "Back")
                    })
                }.padding(.horizontal)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                Spacer()
                VStack(spacing: 15){
                    
                    Button(action: {
                        withAnimation{
                            vm.showMap.toggle()
                        }
                    }, label: {
                        MenuButtonLabel(text: "Show Maps")
                    }).scaleEffect(animate[0] ? 1 : 0)
                    
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        MenuButtonLabel(text: "How to visit country")
                    }).scaleEffect(animate[1] ? 1 : 0)
                    
                    Button(action: {
                        isPad ? UIApplication.shared.open(URL(string: "https://www.instagram.com/guidebook_kyrgyzstan/")!) : showActionSheet.toggle()
                    }, label: {
                        MenuButtonLabel(text: isPad ? "Need Guide? Contact us:" : "Need Personal Guide?")
                    }).scaleEffect(animate[2] ? 1 : 0)
                    
                    Link(destination: URL(string: "https://sites.google.com/view/guidebook-kyrgyzstan/")!, label: {
                        MenuButtonLabel(text: "Privacy Policy")
                    }).padding(.horizontal)
                    .scaleEffect(animate[3] ? 1 : 0)
                }
                Spacer()
                Spacer()
            }
            if vm.showMap{
                MapView()
                    .transition(.opacity)
            }
        }.onAppear{ animations() }
        .sheet(isPresented: $showSheet, content: {
            AboutVisa()
        })
        .actionSheet(isPresented: $showActionSheet, content: actionSheet)
    }
    func animations(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.1)){
                animate[0].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.2)){
                animate[1].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.3)){
                animate[2].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.4)){
                animate[3].toggle()
            }
        }
    }
    
    func actionSheet() -> ActionSheet{
        return ActionSheet(title: Text("Are you going to visit Kyrgyzstan?"), message: Text("If you are, I can meet you at Manas airport, supply you with local active sim card with unlimited access to the internet, help you with efficient changing any currency to soms(local currency), you don't have to book hotel in advance, create a route by your wishes and try to make you to remember your journey for a long time. Just don't hesitate to contact me, by my contacts below ↓ \n\nIf you have any questions or special preferences, as well, you know where are my contacts :"), buttons: [
            .default(Text("By Instagram")) { UIApplication.shared.open(URL(string: "https://www.instagram.com/guidebook_kyrgyzstan/")!)},
            .default(Text("By WhatsApp")){ UIApplication.shared.open(URL(string: "https://wa.me/996703040646?text=Hello%20I'm%20from%20GuideBook")!)},
            .cancel()
        ])
    }
    
}
