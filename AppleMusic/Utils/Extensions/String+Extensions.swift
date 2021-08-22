//
//  String+Extensions.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

extension String {
    func formatDateFromString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let date = dateFormatter.date(from: self)
        guard let date = date else {
            return self
        }
        dateFormatter.dateFormat = dateFormat
        let readableDate = dateFormatter.string(from: date)
        return readableDate
    }
}
