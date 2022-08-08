//
//  SpeakAboutItApp.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/5/22.
//

import SwiftUI

@main
struct SpeakAboutItApp: App {
    
    @StateObject var viewRouter = TabBarViewRouter()
    
    var body: some Scene {
        WindowGroup {
            HomeContentView(viewRouter: viewRouter)
        }
    }
}
