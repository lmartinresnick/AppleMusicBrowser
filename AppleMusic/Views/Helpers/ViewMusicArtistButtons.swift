//
//  ViewMusicArtistButtons.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/21/21.
//

import SwiftUI

struct ViewMusicArtistButtons: View {
    var musicURL: String
    var artistURL: String
    var kind: String
    var body: some View {
        HStack {
            OpenURLButton(urlString: musicURL, buttonText: "View \(kind.capitalized)", buttonTextColor: .white, backgroundColor: .blue)
            Spacer()
            OpenURLButton(urlString: artistURL, buttonText: "View Artist", buttonTextColor: .white, backgroundColor: .blue)
        }
    }
}

struct ViewMusicArtistButtons_Previews: PreviewProvider {
    static var previews: some View {
        ViewMusicArtistButtons(musicURL: "", artistURL: "", kind: "")
    }
}
