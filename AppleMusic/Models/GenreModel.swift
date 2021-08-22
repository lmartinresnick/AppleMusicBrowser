//
//  GenreModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation

public struct GenreModel: Codable {
    
    public var genreId: String
    public var name: String
    public var url: String
    
    public init(genreId: String?, name: String?, url: String?) {
        self.genreId = genreId ?? ""
        self.name = name ?? ""
        self.url = url ?? ""
    }
    
    public init() {
        self.genreId = ""
        self.name = ""
        self.url = ""
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.genreId = try container.decodeIfPresent(String.self, forKey: .genreId) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
