//
//  SuggestedContentView.swift
//  MakeItSensational
//
//  Created by Luca Palmese for the Developer Academy on 29/10/22.
//

import SwiftUI

struct SuggestedContentView: View {
    @StateObject var suggestedViewModel = SuggestedContentViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(suggestedViewModel.suggestedContent) { suggestion in
                    VStack(alignment: .leading) {
                        Text(suggestion.category.uppercased())
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                        Text(suggestion.title.uppercased())
                            .font(.system(size: 23))
                            .fontWeight(.medium)
                        Text(suggestion.artist)
                            .font(.system(size: 23))
                            .foregroundColor(.secondary)
                        suggestion.image
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 364, height: 253)
                            .background(.gray)
                            .cornerRadius(5)
                    }
                }
            }
            .padding([.leading, .trailing], 18)
        }
    }
}

struct SuggestedContentView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedContentView()
    }
}
