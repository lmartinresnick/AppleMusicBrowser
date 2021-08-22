//
//  HapticFeedback.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

struct HapticFeedback {
    
    static func light() {
        let lightImpact = UIImpactFeedbackGenerator(style: .light)
        lightImpact.impactOccurred()
    }
    static func heavy() {
        let heavyImpact = UIImpactFeedbackGenerator(style: .heavy)
        heavyImpact.impactOccurred()
    }
}
