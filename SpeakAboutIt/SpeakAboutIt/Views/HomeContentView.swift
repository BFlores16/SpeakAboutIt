//
//  HomeContentView.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/8/22.
//

import SwiftUI

struct HomeContentView: View {
    @State private var showDetails = false
    @State private var showRegisterBanner = false
    @Environment(\.colorScheme) var appColorMode: ColorScheme
    let screenWidth = UIScreen.main.bounds.width
    var myEventsImages: [Image] = [Image("event-example-3").resizable(), Image("event-example-1").resizable(), Image("event-example-2").resizable()]
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .lightGray
        appearance.backgroundColor = UIColor.init(named: "TabBarBackground")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UIScrollView.appearance().backgroundColor = UIColor(named: "ScreenBackgroundColor")
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                // Register / signup banner
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("TabBarBackground"))
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    Image(appColorMode == .light ? "Logo" : "Logo-White")
                        .resizable()
                        .frame(width: 350, height: 180, alignment: .center)
                        .opacity(0.03)
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    showRegisterBanner.toggle()
                                }
                            }) {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.black)
                                        .frame(width: 20, height: 20)
                                    
                                    Image(systemName: "x.circle.fill").imageScale(.large).foregroundColor(Color("SpeakAboutItYellow"))
                                }
                            }
                            .padding([.trailing, .top], 5.0)
                        }
                        Spacer()
                        Text("Discuss some of the most divisive issues of our time.")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20, weight: .bold))
                        Text("Sign in or register to attend events")
                            .multilineTextAlignment(.center)
                        HStack(spacing: 40) {
                            Button(action: {
                                print("Account register clicked")
                            }) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 100, height: 40, alignment: .center)
                                        .foregroundColor(Color("SpeakAboutItYellow"))
                                        .cornerRadius(6)
                                    Text("Register")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(Color.black)
                                }
                            }
                            Button(action: {
                                print("Account login clicked")
                            }) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 100, height: 40, alignment: .center)
                                        .foregroundColor(Color.black)
                                        .cornerRadius(6)
                                    Text("Log In")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        Spacer()
                    }
                    .frame(width: screenWidth - 40, height: 200, alignment: .center)
                }
                .frame(width: screenWidth - 40, height: 200, alignment: .center)
                .padding()
                .HideView(showRegisterBanner, remove: true)
                
                // My Events scroller
                VStack {
                    VStack {
                        Text("My Events")
                            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(.leading, 30)
                            .font(.system(size: 20, weight: .bold))
                        HStack(alignment: .center, spacing: 10) {
                            ForEach(0..<myEventsImages.count) { i in
                                myEventsImages[i]
                                    .frame(width: 350, height: 200, alignment: .center)
                                    .cornerRadius(10)
                            }
                        }
                        .modifier(ScrollingHStackModifier(items: myEventsImages.count, itemWidth: 350, itemSpacing: 0))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                // Explore scroller
                VStack {
                    HStack {
                        Image(systemName: "safari")
                            .imageScale(.large)
                            .foregroundColor(Color("TabBarHighlight"))
                        Text("Explore")
                            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<myEventsImages.count) { i in
                                myEventsImages[i]
                                    .frame(width: 180, height: 100, alignment: .center)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.width)
                
                // News scroller
                VStack {
                    HStack {
                        Image(systemName: "newspaper")
                            .imageScale(.large)
                            .foregroundColor(Color("TabBarHighlight"))
                        Text("News")
                            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<myEventsImages.count) { i in
                                myEventsImages[i]
                                    .frame(width: 180, height: 100, alignment: .center)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.width)
                
                // Keeps scroll content above navigation bar
                Rectangle()
                    .frame(width: screenWidth, height: UIScreen.main.bounds.height * 0.1, alignment: .center)
                    .hidden()
                
                // Navigation Bar Items
                Text("")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                print("Account button pressed")
                            }) {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.black)
                                    Image(systemName: "person.circle.fill").imageScale(.large).foregroundColor(Color("SpeakAboutItYellow"))
                                }
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Image(appColorMode == .light ? "Logo-Text-Black" : "Logo-Text-White")
                                    .resizable()
                                    .frame(width: 50, height: 30, alignment: .center)
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                Button(action: {
                                    print("Account button pressed")
                                }) {
                                    ZStack {
                                        Image(systemName: "bell.fill").imageScale(.large).foregroundColor(Color("SpeakAboutItYellow"))
                                    }
                                }
                            }
                        }
                    }
            }
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
