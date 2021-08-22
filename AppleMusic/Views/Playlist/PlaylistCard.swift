//
//  PlaylistCard.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct PlaylistCard_Controls {
    var appleMusicText = "Apple Music"
}

struct PlaylistCard: View {
    @State private var controls = PlaylistCard_Controls()
    var playlist: PlaylistModel
    var body: some View {
        ZStack {
            cardBorder(cornerRadius: 12)
            KFImage(URL(string: playlist.artworkUrl100))
                .basicKFModifiers(cgSize: CGSize())
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(cardGradients())
                .overlay(playlistDetails(), alignment: .bottomLeading)
        }
    }
    
    private func playlistDetails() -> some View {
        VStack(alignment: .leading) {
            Text(playlist.name)
                .font(.footnote)
                .bold()
            Text(controls.appleMusicText)
                .font(.caption)
        }.foregroundColor(.white)
        .padding(10)
    }
}

struct PlaylistCard_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistCard(playlist: PlaylistModel())
    }
}
