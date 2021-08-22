//
//  URLs.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation

public struct URLs {
    
    static let explicit = "explicit.json"
    static let baseURL = "https://rss.itunes.apple.com/api/"
    static let appleMusic = "apple-music/"
    
}

public enum Version: String {
    case version1 = "v1/"
}

public enum Country: String {
    case unitedStates = "us/"
}

public enum FeedType: String, CaseIterable, Identifiable {
    case topAlbums = "top-albums/"
    case topSongs = "top-songs/"
    case hotTracks = "hot-tracks/"
    case newReleases = "new-releases/"
    case comingSoon = "coming-soon/"
    
    public var id: FeedType { self }
}

public enum ResultAmount: String, CaseIterable, Identifiable {
    case ten = "10/"
    case twentyFive = "25/"
    case fifty = "50/"
    case hundred = "100/"
    
    public var id: ResultAmount { self }
}

public enum Genre: String, CaseIterable, Identifiable {
    case all = "all/"
    case country = "country/"
    case heavyMetal = "heavy-metal/"
    
    public var id: Genre { self }
}
