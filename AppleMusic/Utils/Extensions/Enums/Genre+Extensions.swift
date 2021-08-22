//
//  Genre+Extensions.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation

extension Genre {
    
    func configureUI() -> String {
        switch self {
        case .all:
            return "All"
        case .country:
            return "Country"
        case .heavyMetal:
            return "Heavy Metal"
        }
    }
}
