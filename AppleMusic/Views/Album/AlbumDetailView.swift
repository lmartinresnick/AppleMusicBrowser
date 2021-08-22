//
//  DetailView.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct AlbumDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var albumVM: AlbumViewModel
    var album: AlbumModel
    
    var relatedAlbums: [AlbumModel] {
        let filterdAlbums  = albumVM.albums.filter { $0.id != album.id }
        return filterdAlbums
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ParallaxImageView(artworkURL: album.artworkUrl100)
            ZStack {
                DetailViewBackground()
                VStack(spacing: 8) {
                    albumDetails()
                    Divider()
                        .padding(.horizontal, 20)
                    RelatedMusicViews.RelatedAlbums(albums: relatedAlbums)
                }
            }
            .offset(y: -35)
            .padding(.bottom, 20)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarItems(trailing: ActionSheetButton(url: URL(string: album.url)))
    }
    
    private func albumDetails() -> some View {
        VStack(spacing: 6) {
            Text(album.name)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            Text(album.artistName)
                .font(.headline)
                .fontWeight(.medium)
            if !album.genres.isEmpty {
                Text("\(album.genres[0].name) • \(album.releaseDate.formatDateFromString(dateFormat: "yyyy"))".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            ViewMusicArtistButtons(musicURL: album.url, artistURL: album.artistUrl, kind: album.kind)
                .padding(.top)
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(album.releaseDate.formatDateFromString(dateFormat: "MMMM dd, yyyy"))
                    Text(album.copyright)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .foregroundColor(.secondary)
                .font(.caption)
                .padding(.top)
                Spacer()
            }
        }
        .padding(.top, 25)
        .padding(.horizontal, 20)
    }
}



struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: AlbumModel())
    }
}
