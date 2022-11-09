//
//  PlaylistsViewModel.swift
//  MakeItSensational
//
//  Created by Luca Palmese for the Developer Academy on 29/10/22.
//

import Foundation

class PlaylistsViewModel: ObservableObject {
    @Published var playlists: [Playlist] = [
        Playlist(
            imageName: "Playlist0",
            name: "Pop Hits Italia",
            category: "Apple Music Pop Italiano"
        ),
        Playlist(
            imageName: "Playlist1",
            name: "RapIT",
            category: "Apple Music Rap Italiano"
        ),
        Playlist(
            imageName: "Playlist2",
            name: "Today's Hits",
            category: "Apple Music"
        )
    ]
}
