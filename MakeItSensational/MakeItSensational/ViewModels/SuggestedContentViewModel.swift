//
//  SuggestedContentViewModel.swift
//  MakeItSensational
//
//  Created by Luca Palmese for the Developer Academy on 29/10/22.
//

import SwiftUI

class SuggestedContentViewModel: ObservableObject {
    @Published var suggestedContent: [MusicEntry] = [
        MusicEntry(
            category: "New single + pre-add now",
            title: "Materia (Terra)",
            artist: "Marco Mengoni",
            imageName: "Image0"
        ),
        MusicEntry(
            category: "Spatial audio",
            title: "Hear it like never before",
            artist: "Laura Pausini",
            imageName: "Image1"
        )
    ]
}
