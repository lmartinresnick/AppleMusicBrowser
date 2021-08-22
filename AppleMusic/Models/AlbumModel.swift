//
//  AlbumModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation

public struct AlbumModel: Codable {
    public var artistName: String
    public var id: String
    public var releaseDate: String
    public var name: String
    public var kind: String
    public var copyright: String
    public var artistId: String
    public var contentAdvisoryRating: String
    public var artistUrl: String
    public var artworkUrl100: String
    public var genres: [GenreModel]
    public var url: String
    
    public init(artistName: String?, id: String?, releaseDate: String?, name: String?, kind: String?, copyright: String?, artistId: String?, contentAdvisoryRating: String?, artistUrl: String?, artworkUrl100: String?, genres: [GenreModel]?, url: String?) {
        self.artistName = artistName ?? ""
        self.id = id ?? ""
        self.releaseDate = releaseDate ?? ""
        self.name = name ?? ""
        self.kind = kind ?? ""
        self.copyright = copyright ?? ""
        self.artistId = artistId ?? ""
        self.contentAdvisoryRating = contentAdvisoryRating ?? ""
        self.artistUrl = artistUrl ?? ""
        self.artworkUrl100 = artworkUrl100 ?? ""
        self.genres = genres ?? [GenreModel]()
        self.url = url ?? ""
    }
    
    public init() {
        self.artistName = ""
        self.id = ""
        self.releaseDate = ""
        self.name = ""
        self.kind = ""
        self.copyright = ""
        self.artistId = ""
        self.contentAdvisoryRating = ""
        self.artistUrl = ""
        self.artworkUrl100 = ""
        self.genres = [GenreModel]()
        self.url = ""
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName) ?? ""
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind) ?? ""
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright) ?? ""
        self.artistId = try container.decodeIfPresent(String.self, forKey: .artistId) ?? ""
        self.contentAdvisoryRating = try container.decodeIfPresent(String.self, forKey: .contentAdvisoryRating) ?? ""
        self.artistUrl = try container.decodeIfPresent(String.self, forKey: .artistUrl) ?? ""
        self.artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? ""
        self.genres = try container.decodeIfPresent([GenreModel].self, forKey: .genres) ?? []
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
