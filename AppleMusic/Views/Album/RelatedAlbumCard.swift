//
//  RelatedAlbumCard.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct RelatedAlbumCard: View {
    var album: AlbumModel
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                cardBorder(cornerRadius: 8)
                KFImage(URL(string: album.artworkUrl100))
                    .basicKFModifiers(cgSize: CGSize(width: 140, height: 140))
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }.frame(width: 140, height: 140)
            Text(album.name)
                .font(.caption)
                .foregroundColor(.primary)
            Text(album.artistName)
                .font(.caption2)
                .foregroundColor(.secondary)
        }.frame(maxWidth: 140)
    }
}

struct RelatedAlbumCard_Previews: PreviewProvider {
    static var previews: some View {
        RelatedAlbumCard(album: AlbumModel())
    }
}
