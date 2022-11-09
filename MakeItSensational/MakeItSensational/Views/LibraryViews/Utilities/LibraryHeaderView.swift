//
//  LibraryHeaderView.swift
//  MakeItSensational
//
//  Created by Luca Palmese for the Developer Academy on 29/10/22.
//

import SwiftUI

struct LibraryHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            AppleMusicButton()
            Text("Browse")
                .font(.system(size: 35))
                .fontWeight(.bold)
            Divider()
                .background(.gray)
                .offset(x: 0, y: -15)
        }
    }
}

struct LibraryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryHeaderView()
    }
}
