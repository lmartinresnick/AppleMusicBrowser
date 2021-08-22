//
//  SongCard.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct SongCard: View {
    var song: SongModel
    var body: some View {
        ZStack {
            cardBorder(cornerRadius: 12)
            KFImage(URL(string: song.artworkUrl100))
                .basicKFModifiers(cgSize: CGSize())
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(cardGradients())
                .overlay(songDetails(), alignment: .bottomLeading)
        }
    }
    
    private func songDetails() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(song.name)
                .font(.footnote)
                .bold()
            Text(song.artistName)
                .font(.caption)
        }.foregroundColor(.white)
        .padding(10)
    }
}

struct SongCard_Previews: PreviewProvider {
    static var previews: some View {
        SongCard(song: SongModel())
    }
}
