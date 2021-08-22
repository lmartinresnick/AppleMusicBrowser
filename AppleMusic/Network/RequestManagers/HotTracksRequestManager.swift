//
//  HotTracksRequestManager.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation

public struct HotTracksRequestManager: APIRequest {
    
    public var amount: ResultAmount
    public var genre: Genre
    
    public init(_ amount: ResultAmount, genre: Genre) {
        self.amount = amount
        self.genre = genre
    }
    
    public var urlRequest: URLRequest {
        let urlString = "\(URLs.baseURL)\(Version.version1.rawValue)\(Country.unitedStates.rawValue)\(URLs.appleMusic)\(FeedType.hotTracks.rawValue)\(genre.rawValue)\(amount.rawValue)\(URLs.explicit)"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
    
    public func decodeResponse(data: Data) throws -> DataResponseHandler<PlaylistModel> {
        let albumInfo = try JSONDecoder().decode(DataResponseHandler<PlaylistModel>.self, from: data)
        return albumInfo
    }
}
