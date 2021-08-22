//
//  KFImage+Extensions.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import Kingfisher
import SwiftUI

extension KFImage {

    func basicKFModifiers(cgSize: CGSize) -> AnyView {
        return AnyView(
          self
            .loadImmediately()
            .placeholder({
                ProgressView()
            })
            .setProcessor(DownsamplingImageProcessor(size: cgSize))
            .scaleFactor(UIScreen.main.scale)
            .cacheOriginalImage()
            .resizable()
            
        )
      }
}
