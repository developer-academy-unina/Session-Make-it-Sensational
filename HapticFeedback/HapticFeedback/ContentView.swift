//
//  ContentView.swift
//  HapticFeedback
//
//  Created by Gianluca Orpello for the Developer Academy on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeedbackGeneratorView()
                .tabItem {
                    Label("Feedback", systemImage: "circle.grid.cross.up.filled")
                }
            
            HapticPaletteView()
                .tabItem {
                    Label("Palette", systemImage: "circle.grid.cross.right.filled")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
