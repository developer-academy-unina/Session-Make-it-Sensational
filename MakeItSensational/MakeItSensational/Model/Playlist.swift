//
//  Playlist.swift
//  MakeItSensational
//
//  Created by Luca Palmese for the Developer Academy on 29/10/22.
//

import Foundation
import SwiftUI

struct Playlist: Identifiable {
    
    var id = UUID()
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var name: String
    var category: String
    
}
