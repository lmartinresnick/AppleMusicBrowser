//
//  FloatingButtonStyle.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

struct FloatingButtonStyle: ButtonStyle {
    public func makeBody(configuration: FloatingButtonStyle.Configuration) -> some View {
        withAnimation(.easeInOut(duration: 0.3)) {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        }
    }
}
