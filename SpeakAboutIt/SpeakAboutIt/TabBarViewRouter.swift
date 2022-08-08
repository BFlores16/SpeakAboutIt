//
//  TabBarViewRouter.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/8/22.
//

import SwiftUI

class TabBarViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case explore
    case discuss
    case more
}
