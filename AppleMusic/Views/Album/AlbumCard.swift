//
//  AlbumCard.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct AlbumCard: View {
    var album: AlbumModel
    var body: some View {
        ZStack {
            cardBorder(cornerRadius: 12)
            KFImage(URL(string: album.artworkUrl100))
                .basicKFModifiers(cgSize: CGSize())
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(cardGradients())
                .overlay(albumDetails(), alignment: .bottomLeading)
        }
    }
    
    private func albumDetails() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(album.name)
                .font(.footnote)
                .bold()
            Text(album.artistName)
                .font(.caption)
        }.foregroundColor(.white)
        .padding(10)
    }
}

struct AlbumCard_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCard(album: AlbumModel(artistName: "Travis Scott", id: "123", releaseDate: "123", name: "Days Before Rodeo", kind: "Album", copyright: "Me", artistId: "123", contentAdvisoryRating: "Explicit", artistUrl: "https://music.apple.com/us/artist/doja-cat/830588310?app=music", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/b1/d0/4a/b1d04ab9-294d-a7c7-fd40-d545536e6654/886449410538.jpg/200x200bb.png", genres: [GenreModel](), url: "https://music.apple.com/us/album/planet-her-deluxe/1574004234?app=music"))
    }
}
