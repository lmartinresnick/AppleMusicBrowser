//
//  ResultAmount+Extensions.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation

extension ResultAmount {
    
    func configureUI() -> String {
        switch self {
        case .ten:
            return "10"
        case .twentyFive:
            return "25"
        case .fifty:
            return "50"
        case .hundred:
            return"100"
        }
    }
}
