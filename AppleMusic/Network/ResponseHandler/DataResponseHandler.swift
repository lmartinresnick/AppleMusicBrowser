//
//  DataResponseHandler.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation

public struct DataResponseHandler<T:Codable>: Codable {
    
    public var feed: FeedModel<T>
    
    public init() {
        self.feed = FeedModel()
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.feed = try container.decodeIfPresent(FeedModel<T>.self, forKey: .feed) ?? FeedModel()
    }
}
