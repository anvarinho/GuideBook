//
//  TextAnimation.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 14.09.2021.
//

import SwiftUI

struct TextAnimation: View {
    
    var word:String
    
    @State var title: [SplitString] = []
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(title){ char in
                Text(char.text)
                    .opacity(char.opacity)
                    .scaleEffect(CGFloat(char.opacity))
                    
            }
        }.onAppear{
            split(text: word)
        }
        
    }
    func split(text: String){
        for (index, char) in text.enumerated(){
            title.append(SplitString(text: String(char)))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.08) {
                withAnimation(.easeInOut(duration: 0.5)){
                    title[index].opacity = 1
                }
            }
        }
    }
}

struct SplitString: Identifiable{
    var id = UUID().uuidString
    var text: String
    var opacity: Double = 0
}

