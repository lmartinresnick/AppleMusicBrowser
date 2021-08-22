//
//  LoadingModifier.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    private var isLoading = false
    init(state isLoading: Bool) {
        self.isLoading = isLoading
    }
    func body(content: Content) -> some View {
        if isLoading {
            ProgressView()
                .imageScale(.large)
                .padding(.top, 20)
        } else {
            content
        }
    }
}

struct LoadingModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello World")
        }.loadingStyle(state: true)
    }
}
