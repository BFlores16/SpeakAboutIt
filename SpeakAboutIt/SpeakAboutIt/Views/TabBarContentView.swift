//
//  TabBarContentView.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/6/22.
//

import SwiftUI

struct TabBarContentView: View {
    
    @State var selectedIndex: Int = 0
    @State var showSpeakAboutItMenu = false
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            HomeContentView()
        case .explore:
            ExploreContentView()
        case .discuss:
            DiscussContentView()
        case .more:
            MoreContentView()
        default:
            HomeContentView()
        }
    }
    
    // Display tab bar and Speak About It button
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let tabBarWidth = geometry.size.width/5
                let tabBarHeight = geometry.size.height/28
                
                // Tab Buttons
                ZStack(alignment: .bottom) {
                    TabItemPageView(height: tabBarHeight, width: tabBarWidth, tabs: TabType.allCases.map({ $0.tabItem}), selectedIndex: $selectedIndex, showSpeakAboutItMenu: $showSpeakAboutItMenu) { index in
                        let type = TabType(rawValue: index) ?? .home
                        getTabView(type: type)
                    }
                    // Speak About It Button
                    ZStack {
                        if showSpeakAboutItMenu {
                            SpeakAboutItButtonMenu(widthAndHeight: geometry.size.width/7)
                                .offset(y: -geometry.size.height/6)
                        }
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
                        }
                        .offset(y: -geometry.size.height/8/2)
                        .onTapGesture {
                            withAnimation {
                                showSpeakAboutItMenu.toggle()
                            }
                        }
                    }
                }
                .background(Color("ScreenBackgroundColor").ignoresSafeArea())
            }
            
        }
    }
}

struct TabBarContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarContentView()
                .preferredColorScheme(.dark)
            TabBarContentView()
                .preferredColorScheme(.light)
        }
    }
}

struct TabItemData {
    let image, title : String
}

// Tab bar item format
struct TabItemView: View {
    
    let width, height: CGFloat
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
            Text(data.title)
                .font(.footnote).bold()
        }
        .padding(.horizontal, -6)
        .foregroundColor(isSelected ? Color("TabBarHighlight") : .gray)
    }
}

// Tab bar format
struct TabBarView: View {
    var height, width : CGFloat
    let tabBarItems: [TabItemData]
    var h: CGFloat = 70
    var w: CGFloat = UIScreen.main.bounds.width - 16
    @Binding var selectedTabIndex: Int
    @Binding var showSpeakAboutItMenu: Bool
    
    var body: some View {
        HStack {
            ForEach(tabBarItems.indices) { index in
                if (tabBarItems[index].title.isEmpty) {
                    let item = tabBarItems[index]
                    Button {
                        self.selectedTabIndex = index
                    } label: {
                        let isSelected = selectedTabIndex == index
                        TabItemView(width: width, height: height, data: item, isSelected: isSelected)
                    }.disabled(true)
                } else {
                    let item = tabBarItems[index]
                    Button {
                        self.selectedTabIndex = index
                        if showSpeakAboutItMenu {
                            withAnimation {
                                showSpeakAboutItMenu.toggle()
                            }
                        }
                    } label: {
                        let isSelected = selectedTabIndex == index
                        TabItemView(width: width, height: height, data: item, isSelected: isSelected)
                    }
                }
            }
        }
        .frame(width: w, height: h)
        .background(Color("TabBarBackground"))
        .cornerRadius(13)
        .shadow(radius: 5, x: 0, y: 4)
    }
}

// Tab bar and content view on top
struct TabItemPageView<Content: View>: View {
    
    let height, width : CGFloat
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @Binding var showSpeakAboutItMenu: Bool
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            VStack {
                Spacer()
                TabBarView(height: height, width: width, tabBarItems: tabs, selectedTabIndex: $selectedIndex, showSpeakAboutItMenu: $showSpeakAboutItMenu)
            }
            .padding(.bottom)
        }
        .onTapGesture {
            if showSpeakAboutItMenu {
                withAnimation {
                    showSpeakAboutItMenu.toggle()
                }
            }
        }
    }
}

// Speak About It pop up buttons
struct SpeakAboutItButtonMenu: View {
    
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color("SpeakAboutItYellow"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.black)
            }
            ZStack {
                Circle()
                    .foregroundColor(Color("SpeakAboutItYellow"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "checklist")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.black)
            }
        }
        .transition(.scale)
    }
}

enum TabType: Int, CaseIterable {
    case home = 0
    case explore
    case empty
    case discuss
    case more
    
    var tabItem: TabItemData {
        switch self {
        case.home:
            return TabItemData(image: "house", title: "Home")
        case.explore:
            return TabItemData(image: "safari", title: "Explore")
        case.discuss:
            return TabItemData(image: "lightbulb", title: "Discuss")
        case.more:
            return TabItemData(image: "square.grid.2x2", title: "More")
        case.empty:
            return TabItemData(image: "", title: "")
        }
    }
}

extension Color {
    struct UI {
        static let SpeakAboutItYellow = Color("SpeakAboutItYellow")
    }
}
