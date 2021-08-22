//
//  DetailViewBackground.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/21/21.
//

import SwiftUI

struct DetailViewBackground: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: -20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(colorScheme == .light ? Color.white : Color.black)
            Rectangle()
                .fill(colorScheme == .light ? Color.white : Color.black)
        }
    }
}

struct DetailViewBackground_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewBackground()
    }
}
