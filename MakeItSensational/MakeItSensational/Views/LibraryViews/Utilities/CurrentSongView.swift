//
//  CurrentSongView.swift
//  MakeItSensational
//
//  Created by Luca Palmese for the Developer Academy on 29/10/22.
//

import SwiftUI

struct CurrentSongView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Image(systemName: "music.note")
                    .foregroundColor(Color(uiColor: .systemGray))
                    .frame(width: 48, height: 48)
                    .background(Color(uiColor: .systemGray5))
                    .mask(RoundedRectangle(cornerRadius: 7))
                    .shadow(color: .gray.opacity(0.3), radius: 3, x: 1, y: 2)
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color(uiColor: .systemGray3), lineWidth: 1))
                Text("Not Playing")
                    .font(.system(size: 18))
                    .offset(x: 10, y: 0)
                Spacer()
                Button {
                    let impact = UIImpactFeedbackGenerator(style: .medium)
                    impact.impactOccurred()
                } label: {
                    Image(systemName: "play.fill")
                        .frame(width: 21, height: 27)
                        .foregroundColor(.primary)
                }
                Image(systemName: "forward.fill")
                    .frame(width: 39, height: 27)
                    .foregroundColor(Color(uiColor: .systemGray))
            }
            .padding([.leading, .trailing], 18)
            .frame(minWidth: 377, idealWidth: 377, maxWidth: .infinity, minHeight: 65, idealHeight: 65, maxHeight: 65, alignment: .center)
            .background(Color(uiColor: .systemGray6))
        }
    }
}

struct CurrentSongView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSongView()
    }
}
