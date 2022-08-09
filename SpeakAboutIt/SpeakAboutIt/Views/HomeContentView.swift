//
//  HomeContentView.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/8/22.
//

import SwiftUI

struct HomeContentView: View {
    
    @State private var showDetails = false
    var body: some View {
        VStack() {
            Button("Show details") {
                showDetails.toggle()
            }

            if showDetails {
                Text("You should follow me on Twitter: @twostraws")
                    .font(.largeTitle)
            }
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
