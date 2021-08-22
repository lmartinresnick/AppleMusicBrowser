//
//  AppleMusicApp.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import SwiftUI

@main
struct AppleMusicApp: App {
    
    @StateObject var albumVM = AlbumViewModel()
    @StateObject var songVM = SongViewModel()
    @StateObject var comingSoonVM = ComingSoonViewModel()
    @StateObject var hotTracksVM = HotTracksViewModel()
    @StateObject var newReleasesVM = NewReleasesViewModel()
    
    init() {
        let temporaryDirectory = NSTemporaryDirectory()
                            let urlCache = URLCache(memoryCapacity: 250_000_000,
                                                    diskCapacity: 300_000_000,
                                                    diskPath: temporaryDirectory)
                            URLCache.shared = urlCache
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(albumVM)
                .environmentObject(songVM)
                .environmentObject(comingSoonVM)
                .environmentObject(hotTracksVM)
                .environmentObject(newReleasesVM)
            
        }
    }
}
