//
//  HomeContentView.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/8/22.
//

import SwiftUI

struct HomeContentView: View {
    @State private var showDetails = false
    var colors: [Color] = [.blue, .green, .red, .orange]
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
            }
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
