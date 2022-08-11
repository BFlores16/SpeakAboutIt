//
//  HomeContentView.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/8/22.
//

import SwiftUI

struct HomeContentView: View {
    @State private var showDetails = false
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .lightGray
        appearance.backgroundColor = UIColor.init(named: "TabBarBackground")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ScreenBackgroundColor").ignoresSafeArea(.container, edges: .bottom)
                VStack {
                    Button("Show details") {
                        showDetails.toggle()
                    }
                    
                    if showDetails {
                        Text("You should follow me on Twitter: @twostraws")
                            .font(.largeTitle)
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading:
                                        Button(action: {
                    print("Account button pressed")
                }) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color.black)
                        Image(systemName: "person.circle.fill").imageScale(.large).foregroundColor(Color("SpeakAboutItYellow"))
                    }
                }, trailing: Button(action: {
                    print("Account button pressed")
                }) {
                    ZStack {
                        Image(systemName: "bell.fill").imageScale(.large).foregroundColor(Color("SpeakAboutItYellow"))
                    }
                }
                )
            }
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
