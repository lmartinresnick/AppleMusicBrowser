//
//  FeedModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation

public struct FeedModel<T:Codable>: Codable {
    public var title: String
    public var id: String
    public var copyright: String
    public var country: String
    public var icon: String
    public var updated: String
    public var results: [T]
    
    public init(title: String?, id: String?, copyright: String?, country: String?, icon: String?, updated: String?, results: [T]?) {
        self.title = title ?? ""
        self.id = id ?? ""
        self.copyright = copyright ?? ""
        self.country = country ?? ""
        self.icon = icon ?? ""
        self.updated = updated ?? ""
        self.results = results ?? [T]()
    }
    
    public init() {
        self.title = ""
        self.id = ""
        self.copyright = ""
        self.country = ""
        self.icon = ""
        self.updated = ""
        self.results = [T]()
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright) ?? ""
        self.country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon) ?? ""
        self.updated = try container.decodeIfPresent(String.self, forKey: .updated) ?? ""
        self.results = try container.decodeIfPresent([T].self, forKey: .results) ?? [T]()
    }
}
