//
//  ParallaxImageView.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI
import Kingfisher

struct ParallaxImageView: View {
    var artworkURL: String
    var body: some View {
        GeometryReader { reader in
            if reader.frame(in: .global).minY > -480 {
                KFImage(URL(string: artworkURL))
                    .basicKFModifiers(cgSize: CGSize(width: UIScreen.main.bounds.width, height: 480))
                    .scaledToFill()
                    // moving View Up....
                    .offset(y: -reader.frame(in: .global).minY)
                    // going to add parallax effect....
                    .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY > 0 ? reader.frame(in: .global).minY + 480 : 480)
            }
        }
        .frame(height: 480)
    }
}

struct ParallaxImageView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxImageView(artworkURL: "")
    }
}
