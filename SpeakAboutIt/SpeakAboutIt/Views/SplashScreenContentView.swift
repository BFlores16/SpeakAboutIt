//
//  SplashScreenContentView.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/9/22.
//

import SwiftUI

struct SplashScreenContentView: View {
    @State private var splashScreenIsActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        GeometryReader { geometry in
            if splashScreenIsActive {
                TabBarContentView()
            } else {
                Color("SpeakAboutItYellow").ignoresSafeArea()
                VStack {
                    VStack {
                        Spacer()
                        Image("SpeakAboutItLogoWithText")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width/1.5, height: geometry.size.height/8)
                        Spacer()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(
                        Image("SplashScreenBackground")
                            .resizable()
                            .scaledToFit()
                    )
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.splashScreenIsActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenContentView()
    }
}
