//
//  FeedType+Extensions.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

extension FeedType {
    
    func configureUI() -> String {
        switch self {
        case .comingSoon:
            return "🔜"
        case .hotTracks:
            return "🔥"
        case .newReleases:
            return "🆕"
        case .topAlbums:
            return"💿"
        case .topSongs:
            return "🎵"
        }
    }
    
    func configureTitle(amount: ResultAmount) -> String {
        switch self {
        case .comingSoon:
            return "Coming Soon"
        case .hotTracks:
            return "Hot Tracks"
        case .newReleases:
            return "New Releases"
        case .topSongs:
            return "Top \(amount.configureUI()) Songs"
        case .topAlbums:
            return "Top \(amount.configureUI()) Albums"
        }
    }
}
