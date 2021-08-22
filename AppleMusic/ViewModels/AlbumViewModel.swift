//
//  AlbumViewModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation
import SwiftUI

public final class AlbumViewModel: ObservableObject {
    
    @Published var albums = [AlbumModel]()
    
    
    func loadTopAlbums(amount: ResultAmount, completion: @escaping (Bool) -> Void) {
        let albumRequest = TopAlbumsRequestManager(amount)
        
        NetworkManager.shared.sendRequest(albumRequest) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let albumResponse):
                DispatchQueue.main.async {
                    self.albums = albumResponse.feed.results
                    completion(true)
                }
            case .failure(let error):
                print("Error retrieving top albums", error.localizedDescription)
                completion(false)
            }
        }
    }
}
