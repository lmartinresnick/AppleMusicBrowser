//
//  HomeView.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct HomeView_Controls {
    var dataLoading = false
    var resultAmount = ResultAmount.ten
    var genre = Genre.all
    var feedType = FeedType.topAlbums
}

struct HomeView: View {
    
    @EnvironmentObject var albumVM: AlbumViewModel
    @EnvironmentObject var songVM: SongViewModel
    @EnvironmentObject var comingSoonVM: ComingSoonViewModel
    @EnvironmentObject var hotTracksVM: HotTracksViewModel
    @EnvironmentObject var newReleasesVM: NewReleasesViewModel
    @State private var controls = HomeView_Controls()
    
    var title: String {
        let feed = controls.feedType
        let title = feed.configureTitle(amount: controls.resultAmount)
        return title
    }
    
    var body: some View {
        VStack {
            feedPicker()
            ScrollView(showsIndicators: false) {
                configureMusicGrid()
                    .padding(.top, 8)
            }
        }.padding(.horizontal, 12)
        .navigationTitle(title)
        .toolbar {
            ToolbarItem {
                filterMenu()
            }
        }
        .onChange(of: controls.resultAmount, perform: { amount in
            getMusic(amount: amount, feed: controls.feedType, genre: controls.genre)
        })
        .onChange(of: controls.feedType, perform: { feed in
            controls.genre = Genre.all
            getMusic(amount: controls.resultAmount, feed: feed, genre: controls.genre)
        })
        .onChange(of: controls.genre, perform: { genre in
            getMusic(amount: controls.resultAmount, feed: controls.feedType, genre: genre)
        })
        .onAppear {
            getMusic(amount: controls.resultAmount, feed: controls.feedType, genre: controls.genre)
        }
        .embedInNavigationView()
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func configureMusicGrid() -> some View {
        Group {
            switch controls.feedType {
            case .topAlbums:
                MusicGrids.AlbumGrid(albums: albumVM.albums)
            case .topSongs:
                MusicGrids.SongGrid(songs: songVM.songs)
            case .hotTracks:
                if controls.genre == .heavyMetal {
                    MusicGrids.SongGrid(songs: hotTracksVM.hotTracksHeavyMetal)
                } else {
                    MusicGrids.PlaylistGrid(playlists: hotTracksVM.hotTracks)
                }
            case .newReleases:
                if controls.genre == .country {
                    MusicGrids.PlaylistGrid(playlists: newReleasesVM.newReleasesCountry)
                } else {
                    MusicGrids.AlbumGrid(albums: newReleasesVM.newReleases)
                }
            case .comingSoon:
                MusicGrids.AlbumGrid(albums: comingSoonVM.comingSoon)
            }
        }.loadingStyle(state: controls.dataLoading)
    }
    
    private func feedPicker() -> some View {
        Picker("Feed", selection: $controls.feedType) {
            ForEach(FeedType.allCases) { feedType in
                Text(feedType.configureUI())
                    .tag(feedType)
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
    
    private func filterMenu() -> some View {
        Menu {
            Picker("Amount", selection: $controls.resultAmount) {
                ForEach(ResultAmount.allCases) { amount in
                    Text("Top \(amount.configureUI())")
                        .tag(amount)
                }
            }.pickerStyle(InlinePickerStyle())
            
            if controls.feedType != FeedType.topAlbums && controls.feedType != FeedType.topSongs && controls.feedType != FeedType.comingSoon {
                Picker("Genre", selection: $controls.genre) {
                    ForEach(Genre.allCases) { genre in
                        Text("\(genre.configureUI())")
                            .tag(genre)
                    }
                }.pickerStyle(InlinePickerStyle())
            }
        } label: {
            Label("", systemImage: "slider.horizontal.3")
        }
    }
    
    private func getMusic(amount: ResultAmount, feed: FeedType, genre: Genre) {
        switch feed {
        case .hotTracks:
            return genre == .heavyMetal ? loadHotTracksHeavyMetal(amount: amount) : loadHotTracks(amount: amount, genre: genre)
        case .comingSoon:
            return loadComingSoon(amount: amount, genre: genre)
        case .newReleases:
            return genre == .country ? loadNewReleasesCountry(amount: amount) : loadNewReleases(amount: amount, genre: genre)
        case .topAlbums:
            return loadAlbums(amount: amount)
        case .topSongs:
            return loadSongs(amount: amount)
        }
    }
    
    private func loadAlbums(amount: ResultAmount) {
        controls.dataLoading = true
        albumVM.loadTopAlbums(amount: amount) { success in
            if success {
                controls.dataLoading = false
            } else {
                print("Error loading albums!")
            }
        }
    }
    
    private func loadSongs(amount: ResultAmount) {
        controls.dataLoading = true
        songVM.loadTopSongs(amount: amount) { success in
            if success {
                controls.dataLoading = false
            } else {
                print("Error loading songs!")
            }
        }
    }
    
    private func loadHotTracks(amount: ResultAmount, genre: Genre) {
        controls.dataLoading = true
        hotTracksVM.loadHotTracks(amount: amount, genre: genre) { success in
            if success {
                controls.dataLoading = false
            } else {
                print("Error loading hot tracks!")
            }
        }
    }
    
    private func loadHotTracksHeavyMetal(amount: ResultAmount) {
        controls.dataLoading = true
        hotTracksVM.loadHotTracksHeavyMetal(amount: amount) { success in
            if success {
                controls.dataLoading = false
            } else {
                print("Error loading hot tracks heavy metal!")
            }
        }
    }
    
    private func loadNewReleases(amount: ResultAmount, genre: Genre) {
        controls.dataLoading = true
        newReleasesVM.getNewReleases(amount: amount, genre: genre) { success in
            if success {
                controls.dataLoading = false
            } else {
                print("Error loading new releases!")
            }
        }
    }
    
    private func loadNewReleasesCountry(amount: ResultAmount) {
        controls.dataLoading = true
        newReleasesVM.loadNewReleasesCountry(amount: amount) { success in
            if success {
                controls.dataLoading = false
            } else {
                print("Error loading new releases country!")
            }
        }
    }
    
    private func loadComingSoon(amount: ResultAmount, genre: Genre) {
        controls.dataLoading = true
        comingSoonVM.loadComingSoon(amount: amount) { success in
            if success {
                controls.dataLoading = false
            } else {
                print("Error loading coming soon!")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AlbumViewModel())
            .environmentObject(SongViewModel())
            .environmentObject(ComingSoonViewModel())
            .environmentObject(HotTracksViewModel())
            .environmentObject(NewReleasesViewModel())
    }
}
