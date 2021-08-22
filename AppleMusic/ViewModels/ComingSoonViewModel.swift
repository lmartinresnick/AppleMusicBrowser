//
//  ComingSoonViewModel.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

public final class ComingSoonViewModel: ObservableObject {
    
    @Published var comingSoon = [AlbumModel]()
    
    func loadComingSoon(amount: ResultAmount, completion: @escaping (Bool) -> Void) {
        
        let comingSoonRequest = ComingSoonRequestManager(amount)
        
        NetworkManager.shared.sendRequest(comingSoonRequest) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let comingSoonResponse):
                DispatchQueue.main.async {
                    self.comingSoon = comingSoonResponse.feed.results
                    completion(true)
                }
            case .failure(let error):
                print("Error retrieving coming soon albums!", error.localizedDescription)
                completion(false)
            }
        }
    }
}
