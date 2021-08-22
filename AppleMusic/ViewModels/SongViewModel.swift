//
//  SongViewModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation
import SwiftUI

public final class SongViewModel: ObservableObject {
    
    @Published var songs = [SongModel]()
    
    func loadTopSongs(amount: ResultAmount, completion: @escaping (Bool) -> Void) {
        let songRequest = TopSongsRequestManager(amount)
        
        NetworkManager.shared.sendRequest(songRequest) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let songResponse):
                DispatchQueue.main.async {
                    self.songs = songResponse.feed.results
                    completion(true)
                }
            case .failure(let error):
                print("Error retrieving top 100 songs!", error.localizedDescription)
                completion(false)
            }
        }
    }
}
