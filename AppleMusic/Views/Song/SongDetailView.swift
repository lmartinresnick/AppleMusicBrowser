//
//  SongDetailView.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct SongDetailView_Controls {
    var metalText = "Metal"
}

struct SongDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var songVM: SongViewModel
    @EnvironmentObject var hotTracksVM: HotTracksViewModel
    @State private var controls = SongDetailView_Controls()
    var song: SongModel
    
    var relatedSongs: [SongModel] {
        if song.genres[0].name == controls.metalText {
            let filteredHotTracks = hotTracksVM.hotTracksHeavyMetal.filter { $0.id != song.id }
            return filteredHotTracks
        } else {
            let filterdSongs = songVM.songs.filter { $0.id != song.id }
            return filterdSongs
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ParallaxImageView(artworkURL: song.artworkUrl100)
            ZStack {
                DetailViewBackground()
                VStack(spacing: 8) {
                    songDetails()
                    Divider()
                        .padding(.horizontal, 20)
                    RelatedMusicViews.RelatedSongs(songs: relatedSongs)
                }
            }
            .offset(y: -35)
            .padding(.bottom, 20)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarItems(trailing: ActionSheetButton(url: URL(string: song.url)))
    }
    
    private func songDetails() -> some View {
        VStack(spacing: 6) {
            Text(song.name)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            Text(song.artistName)
                .font(.headline)
                .fontWeight(.medium)
            if !song.genres.isEmpty {
                Text("\(song.genres[0].name) • \(song.releaseDate.formatDateFromString(dateFormat: "yyyy"))".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            ViewMusicArtistButtons(musicURL: song.url, artistURL: song.artistUrl, kind: song.kind)
                .padding(.top)
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(song.releaseDate.formatDateFromString(dateFormat: "MMMM dd, yyyy"))
                    Text(song.copyright)
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


struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: SongModel())
    }
}
