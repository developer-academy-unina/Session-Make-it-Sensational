//
//  LibraryView.swift
//  MakeItSensational
//
//  Created by Luca Palmese for the Developer Academy on 29/10/22.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                
                LibraryHeaderView()
                .padding([.leading, .trailing], 18)
                
                SuggestedContentView()
                .offset(x: 0, y: -10)
                
                PlaylistsView()
                
            }
            .offset(x: 0, y: 15)
            
            CurrentSongView()
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
