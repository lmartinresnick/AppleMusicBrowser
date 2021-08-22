//
//  RelatedMusicViews.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI

public struct RelatedMusicViews {
    
    public static func RelatedAlbums(albums: [AlbumModel]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 12) {
                ForEach(albums.prefix(8), id: \.id) { album in
                    NavigationLink(destination: AlbumDetailView(album: album)) {
                        RelatedAlbumCard(album: album)
                    }.buttonStyle(FloatingButtonStyle())
                    .navigationViewStyle(StackNavigationViewStyle())
                }
            }.padding(.horizontal, 20)
        }.relatedMusicView()
    }
    
    public static func RelatedSongs(songs: [SongModel]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 12) {
                ForEach(songs.prefix(8), id: \.id) { song in
                    NavigationLink(destination: SongDetailView(song: song)) {
                        RelatedSongCard(song: song)
                    }.buttonStyle(FloatingButtonStyle())
                    .navigationViewStyle(StackNavigationViewStyle())
                }
            }.padding(.horizontal, 20)
        }.relatedMusicView()
    }
    
    public static func RelatedPlaylists(playlists: [PlaylistModel]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 12) {
                ForEach(playlists.prefix(8), id: \.id) { playlist in
                    NavigationLink(destination: PlaylistDetailView(playlist: playlist)) {
                        RelatedPlaylistCard(playlist: playlist)
                    }.buttonStyle(FloatingButtonStyle())
                    .navigationViewStyle(StackNavigationViewStyle())
                }
            }.padding(.horizontal, 20)
        }.relatedMusicView()
    }
}

