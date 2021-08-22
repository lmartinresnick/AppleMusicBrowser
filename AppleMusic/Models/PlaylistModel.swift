//
//  PlaylistModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation


#warning("iTunesBrand is same as PlaylistModel, so will PlaylistModel for iTunesBrand aka NewReleasesCountry Section!")

public struct PlaylistModel: Codable {
    public var id: String
    public var name: String
    public var kind: String
    public var artworkUrl100: String
    public var genres: [GenreModel]
    public var url: String
    
    public init(id: String?, name: String?, kind: String?, artworkUrl100: String?, genres: [GenreModel]?, url: String?) {
        self.id = id ?? ""
        self.name = name ?? ""
        self.kind = kind ?? ""
        self.artworkUrl100 = artworkUrl100 ?? ""
        self.genres = genres ?? []
        self.url = url ?? ""
    }
    
    public init() {
        self.id = ""
        self.name = ""
        self.kind = ""
        self.artworkUrl100 = ""
        self.genres = []
        self.url = ""
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind) ?? ""
        self.artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? ""
        self.genres = try container.decodeIfPresent([GenreModel].self, forKey: .genres) ?? []
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
