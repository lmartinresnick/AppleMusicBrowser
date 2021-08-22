//
//  PlaylistDetailView.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct PlaylistDetailView_Controls {
    var appleMusicText = "Apple Music"
    var updatedYesterdayText = "Updated Yesterday"
}

struct PlaylistDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var hotTracksVM: HotTracksViewModel
    @EnvironmentObject var newReleasesVM: NewReleasesViewModel
    @State private var controls = PlaylistDetailView_Controls()
    var playlist: PlaylistModel
    
    var relatedPlaylists: [PlaylistModel] {
        if playlist.kind == "iTunesBrand" {
            let filteredNewReleases  = newReleasesVM.newReleasesCountry.filter { $0.id != playlist.id }
            return filteredNewReleases
        } else {
            let filteredHotTracks  = hotTracksVM.hotTracks.filter { $0.id != playlist.id }
            return filteredHotTracks
        }
        
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ParallaxImageView(artworkURL: playlist.artworkUrl100)
            ZStack {
                DetailViewBackground()
                VStack(spacing: 8) {
                    playlistDetails()
                    Divider()
                        .padding(.horizontal, 20)
                    RelatedMusicViews.RelatedPlaylists(playlists: relatedPlaylists)
                }
            }
            .offset(y: -35)
            .padding(.bottom, 20)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarItems(trailing: ActionSheetButton(url: URL(string: playlist.url)))
    }
    
    private func playlistDetails() -> some View {
        VStack(spacing: 6) {
            Text(playlist.name)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            Text(controls.appleMusicText)
                .font(.headline)
                .fontWeight(.medium)
            if !playlist.genres.isEmpty {
                Text("\(playlist.genres[0].name) • \(controls.updatedYesterdayText)".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
            } else {
                Text(controls.updatedYesterdayText.uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            OpenURLButton(urlString: playlist.url, buttonText: "View \(playlist.kind == "iTunesBrand" ? "in Apple Music" : playlist.kind.capitalized)", buttonTextColor: .white, backgroundColor: .blue)
                .padding(.top)
        }
        .padding(.top, 25)
        .padding(.horizontal, 20)
    }
}


struct PlaylistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistDetailView(playlist: PlaylistModel())
    }
}
