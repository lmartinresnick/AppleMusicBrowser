//
//  NewReleasesViewModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

public final class NewReleasesViewModel: ObservableObject {
    
    @Published var newReleases = [AlbumModel]()
    @Published var newReleasesCountry = [PlaylistModel]()
    
    func getNewReleases(amount: ResultAmount, genre: Genre, completion: @escaping (Bool) -> Void) {
        let newReleasesRequest = NewReleasesRequestManager(amount, genre: genre)
        
        NetworkManager.shared.sendRequest(newReleasesRequest) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let newReleasesResponse):
                DispatchQueue.main.async {
                    self.newReleases = newReleasesResponse.feed.results
                    completion(true)
                }
            case .failure(let error):
                print("Error retrieving 10 new releases!", error.localizedDescription)
                completion(false)
            }
        }
    }
    
    func loadNewReleasesCountry(amount: ResultAmount, completion: @escaping (Bool) -> Void) {
        let newReleasesRequest = NewReleasesCountryRequestManager(amount)
        
        NetworkManager.shared.sendRequest(newReleasesRequest) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let newReleasesResponse):
                DispatchQueue.main.async {
                    self.newReleasesCountry = newReleasesResponse.feed.results
                    completion(true)
                }
            case .failure(let error):
                print("Error retrieving 10 new releases!", error.localizedDescription)
                completion(false)
            }
        }
    }
}
