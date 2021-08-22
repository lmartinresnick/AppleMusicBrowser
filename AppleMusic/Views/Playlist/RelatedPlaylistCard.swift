//
//  RelatedPlaylistCard.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct RelatedPlaylistCard_Controls {
    var appleMusicText = "Apple Music"
}

struct RelatedPlaylistCard: View {
    @State private var controls = RelatedPlaylistCard_Controls()
    var playlist: PlaylistModel
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                cardBorder(cornerRadius: 8)
                KFImage(URL(string: playlist.artworkUrl100))
                    .basicKFModifiers(cgSize: CGSize(width: 140, height: 140))
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }.frame(width: 140, height: 140)
            Text(playlist.name)
                .font(.caption)
                .foregroundColor(.primary)
            Text(controls.appleMusicText)
                .font(.caption)
                .foregroundColor(.secondary)
        }.frame(maxWidth: 140)
    }
}

struct PlaylistRelatedCard_Previews: PreviewProvider {
    static var previews: some View {
        RelatedPlaylistCard(playlist: PlaylistModel())
    }
}
