//
//  DismissButton.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 06.07.21.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Image(systemName: "chevron.compact.down")
                .renderingMode(.original)
                .scaleEffect(3)
                .offset(y: 10)
                .foregroundColor(.black)
                .opacity(0.8)
                .onTapGesture {
                    withAnimation{
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            Spacer()
        }
    }
}
