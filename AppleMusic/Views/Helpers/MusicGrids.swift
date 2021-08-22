//
//  MusicGrids.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

public struct MusicGrids {
    
    public static let gridItems = [GridItem(.flexible(), spacing: 12), GridItem(.flexible())]
    
    public static func AlbumGrid(albums: [AlbumModel]) -> some View {
        LazyVGrid(columns: gridItems, alignment: .center, spacing: 12) {
            ForEach(albums, id: \.id) { album in
                NavigationLink(destination: AlbumDetailView(album: album)) {
                    AlbumCard(album: album)
                }.buttonStyle(FloatingButtonStyle())
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
    
    public static func SongGrid(songs: [SongModel]) -> some View {
        LazyVGrid(columns: gridItems, alignment: .center, spacing: 12) {
            ForEach(songs, id: \.id) { song in
                NavigationLink(destination: SongDetailView(song: song)) {
                    SongCard(song: song)
                }.buttonStyle(FloatingButtonStyle())
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
    
    public static func PlaylistGrid(playlists: [PlaylistModel]) -> some View {
        LazyVGrid(columns: gridItems, alignment: .center, spacing: 12) {
            ForEach(playlists, id: \.id) { playlist in
                NavigationLink(destination: PlaylistDetailView(playlist: playlist)) {
                    PlaylistCard(playlist: playlist)
                }.buttonStyle(FloatingButtonStyle())
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}
