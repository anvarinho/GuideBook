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
    var isPad: Bool{
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    @EnvironmentObject var vm: ViewModel
    var body: some View {
        ZStack{
            BackgroundView()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation{
                            vm.showInfo.toggle()
                        }
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.orange)
                            .scaleEffect(2)
                            .padding()
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
                        Text("Show Maps")
                            .foregroundColor(.orange)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .padding(.vertical,4)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3).foregroundColor(.orange)
                            )
                            .shadow(color: .black, radius: 3, x: 3, y: 3)
                    })
                    .scaleEffect(animate[0] ? 1 : 0)
                    
                    
                    Button(action: {
                        withAnimation{
                            showSheet.toggle()
                        }
                    }, label: {
                        Text("How to visit country".capitalized)
                            .foregroundColor(.orange)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .padding(.vertical,4)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3).foregroundColor(.orange)
                            )
                            .shadow(color: .black, radius: 3, x: 3, y: 3)
                    })
                    .scaleEffect(animate[1] ? 1 : 0)
                    
                    Button(action: {
                        withAnimation{
                            if isPad{
                                UIApplication.shared.open(URL(string: "https://www.instagram.com/guidebook_kyrgyzstan/")!)
                            }else{
                                showActionSheet.toggle()
                            }
                        }
                    }, label: {
                        Text(isPad ? "Need Guide? Contact us:" : "Need Personal Guide?")
                            .foregroundColor(.orange)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .padding(.vertical,4)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3).foregroundColor(.orange)
                            )
                            .shadow(color: .black, radius: 3, x: 3, y: 3)
                    })
                    .scaleEffect(animate[2] ? 1 : 0)
                    
                    Link(destination: URL(string: "https://sites.google.com/view/guidebook-kyrgyzstan/")!, label: {
                        Text("Privacy Policy")
                            .foregroundColor(.orange)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .padding(.vertical,4)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 3).foregroundColor(.orange)
                            )
                            .shadow(color: .black, radius: 3, x: 3, y: 3)
                    }).padding(.horizontal)
                    .scaleEffect(animate[3] ? 1 : 0)
                }
                Spacer()
                Spacer()
            }
            if vm.showMap{
                MapView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }
        }.onAppear{ animations() }
        .sheet(isPresented: $showSheet, content: {
                AboutVisa()
        })
        .actionSheet(isPresented: $showActionSheet, content: actionSheet)
    }
    func animations(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.3)){
                animate[0].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.4)){
                animate[1].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.5)){
                animate[2].toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(Animation.spring(response: 0.7, dampingFraction: 1, blendDuration: 0.6)){
                animate[3].toggle()
            }
        }
    }
    
    func actionSheet() -> ActionSheet{
        return ActionSheet(title: Text("Need Guide?"), message: Text("Contact us:"), buttons: [
            .default(Text("By Instagram")) { UIApplication.shared.open(URL(string: "https://www.instagram.com/guidebook_kyrgyzstan/")!)},
            .default(Text("By WhatsApp")){ UIApplication.shared.open(URL(string: "https://wa.me/996703040646?text=Hello%20I'm%20from%20GuideBook")!)},
            .cancel()
        ])
    }
    
}
