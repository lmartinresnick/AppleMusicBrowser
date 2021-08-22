//
//  RelatedSongView.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct RelatedSongCard: View {
    var song: SongModel
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                cardBorder(cornerRadius: 8)
                KFImage(URL(string: song.artworkUrl100))
                    .basicKFModifiers(cgSize: CGSize(width: 140, height: 140))
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }.frame(width: 140, height: 140)
            Text(song.name)
                .font(.caption)
                .foregroundColor(.primary)
            Text(song.artistName)
                .font(.caption2)
                .foregroundColor(.secondary)
        }.frame(maxWidth: 140)
    }
}

struct RelatedSongView_Previews: PreviewProvider {
    static var previews: some View {
        RelatedSongCard(song: SongModel())
    }
}
