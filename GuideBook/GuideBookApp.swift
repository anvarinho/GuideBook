//
//  GuideBookApp.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

@main
struct GuideBookApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchScreenAnimation().environmentObject(ViewModel())
        }
    }
}
