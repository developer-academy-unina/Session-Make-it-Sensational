//
//  ContentView.swift
//  MakeItSensational
//
//  Created by Luca Palmese for the Developer Academy on 29/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                LibraryView()
                    .tabItem {
                        Image("LibraryIcon")
                            .renderingMode(.template)
                        Text("Library")
                    }
                LibraryView()
                    .tabItem {
                        Label("Listen Now", systemImage: "play.circle.fill")
                    }
                LibraryView()
                    .tabItem {
                        Label("Browse", systemImage: "square.grid.2x2.fill")
                    }
                LibraryView()
                    .tabItem {
                        Label("Radio", systemImage: "dot.radiowaves.left.and.right")
                    }
                LibraryView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color(uiColor: .systemGray6), for: .tabBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
