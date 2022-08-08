//
//  HomeContentView.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/6/22.
//

import SwiftUI

struct HomeContentView: View {
    
    @StateObject var viewRouter: TabBarViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let tabBarWidth = geometry.size.width/5
                let tabBarHeight = geometry.size.height/28
                
                Spacer()
                switch viewRouter.currentPage {
                 case .home:
                     Text("Home")
                 case .explore:
                     Text("Explore")
                 case .discuss:
                     Text("Discuss")
                 case .more:
                     Text("More")
                }
                Spacer()
                
                // Tab Bar
                HStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: tabBarWidth, height: tabBarHeight, systemIconName: "house", tabName: "Home")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .explore, width: tabBarWidth, height: tabBarHeight, systemIconName: "safari", tabName: "Explore")
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
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .discuss, width: tabBarWidth, height: tabBarHeight, systemIconName: "lightbulb", tabName: "Discuss")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .more, width: tabBarWidth, height: tabBarHeight, systemIconName: "square.grid.2x2", tabName: "More")
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
            HomeContentView(viewRouter: TabBarViewRouter())
                .preferredColorScheme(.dark)
            HomeContentView(viewRouter: TabBarViewRouter())
                .preferredColorScheme(.light)
        }
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: TabBarViewRouter
    let assignedPage: Page
    
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
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}

extension Color {
    struct UI {
        static let SpeakAboutItYellow = Color("SpeakAboutItYellow")
    }
}
