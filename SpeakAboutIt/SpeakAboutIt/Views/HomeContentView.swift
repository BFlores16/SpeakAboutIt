//
//  HomeContentView.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/6/22.
//

import SwiftUI

struct HomeContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let tabBarWidth = geometry.size.width/5
                let tabBarHeight = geometry.size.height/28
                
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
                
                // Tab Bar
                HStack {
                    TabBarIcon(width: tabBarWidth, height: tabBarHeight, systemIconName: "house", tabName: "Home")
                    TabBarIcon(width: tabBarWidth, height: tabBarHeight, systemIconName: "safari", tabName: "Explore")
                    ZStack {
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: geometry.size.width/6, height: geometry.size.width/6)
                            .shadow(radius: 4)
                        Circle()
                            .foregroundColor(Color.UI.SpeakAboutItYellow)
                            .frame(width: geometry.size.width/6.5, height: geometry.size.width/6.5)
                            .shadow(radius: 4)
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/8-6, height: geometry.size.width/8-6)
//                        TabBarIcon(width: tabBarWidth, height: tabBarHeight, systemIconName: "bubble.left.fill", tabName: "")
                    }
                    .offset(y: -geometry.size.height/8/2)
                    TabBarIcon(width: tabBarWidth, height: tabBarHeight, systemIconName: "lightbulb", tabName: "Discuss")
                    TabBarIcon(width: tabBarWidth, height: tabBarHeight, systemIconName: "square.grid.2x2", tabName: "More")
                }.frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBarBackground").shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeContentView()
                .preferredColorScheme(.dark)
            HomeContentView()
                .preferredColorScheme(.light)
        }
    }
}

struct TabBarIcon: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
            Text(tabName)
                .font(.footnote).bold()
        }
        .padding(.horizontal, -4)
    }
}

extension Color {
    struct UI {
        static let SpeakAboutItYellow = Color("SpeakAboutItYellow")
    }
}
