//
//  HotTracksHeavyMetalRequestManager.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation

public struct HotTracksHeavyMetalRequestManager: APIRequest {
    
    public var amount: ResultAmount
    
    public init(_ amount: ResultAmount) {
        self.amount = amount
    }
    
    public var urlRequest: URLRequest {
        let urlString = "\(URLs.baseURL)\(Version.version1.rawValue)\(Country.unitedStates.rawValue)\(URLs.appleMusic)\(FeedType.hotTracks.rawValue)\(Genre.heavyMetal.rawValue)\(amount.rawValue)\(URLs.explicit)"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
    
    public func decodeResponse(data: Data) throws -> DataResponseHandler<SongModel> {
        let albumInfo = try JSONDecoder().decode(DataResponseHandler<SongModel>.self, from: data)
        return albumInfo
    }
}
