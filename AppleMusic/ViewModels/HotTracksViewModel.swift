//
//  HotTracksViewModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

public final class HotTracksViewModel: ObservableObject {
    
    @Published var hotTracks = [PlaylistModel]()
    @Published var hotTracksHeavyMetal = [SongModel]()
    
    func loadHotTracks(amount: ResultAmount, genre: Genre, completion: @escaping (Bool) -> Void) {
        
        let hotTracksRequest = HotTracksRequestManager(amount, genre: genre)
        
        NetworkManager.shared.sendRequest(hotTracksRequest) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let hotTracksResponse):
                DispatchQueue.main.async {
                    self.hotTracks = hotTracksResponse.feed.results
                    completion(true)
                }
            case .failure(let error):
                print("Error retrieving top 100 songs!", error.localizedDescription)
                completion(false)
            }
        }
    }
    
    func loadHotTracksHeavyMetal(amount: ResultAmount, completion: @escaping (Bool) -> Void) {
        
        let hotTracksRequest = HotTracksHeavyMetalRequestManager(amount)
        
        NetworkManager.shared.sendRequest(hotTracksRequest) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let hotTracksResponse):
                DispatchQueue.main.async {
                    self.hotTracksHeavyMetal = hotTracksResponse.feed.results
                    completion(true)
                }
            case .failure(let error):
                print("Error retrieving top 100 songs!", error.localizedDescription)
                completion(false)
            }
        }
    }
}
