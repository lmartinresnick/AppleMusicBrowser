//
//  OpenURLButton.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import SwiftUI

struct OpenURLButton: View {
    
    @Environment(\.openURL) var openURL
    var urlString: String
    var buttonText: String
    var buttonTextColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Button(action: {
            HapticFeedback.light()
            guard let url = URL(string: urlString) else {
                return
            }
            openURL(url)
        }) {
            Text(buttonText)
                .font(.subheadline)
                .bold()
                .foregroundColor(buttonTextColor)
                .fixedSize(horizontal: true, vertical: false)
                .padding(.vertical, 12)
                .padding(.horizontal, 42)
                .background(backgroundColor)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: 2)
                .contentShape(Rectangle())
        }.buttonStyle(FloatingButtonStyle())
    }
}

struct OpenURLButton_Previews: PreviewProvider {
    static var previews: some View {
        OpenURLButton(urlString: "", buttonText: "", buttonTextColor: .blue, backgroundColor: .white)
    }
}
