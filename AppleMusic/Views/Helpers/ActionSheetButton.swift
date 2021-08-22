//
//  ActionSheetButton.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/21/21.
//

import SwiftUI

struct ActionSheetButton: View {
    
    var url: URL?
    
    var body: some View {
        Button(action: {
            HapticFeedback.light()
            shareToActionSheet(url: url)
        }) {
            Image(systemName: "square.and.arrow.up")
                .imageScale(.medium)
        }
    }
    
    func shareToActionSheet(url: URL?) {
        
        var urlToShare: [URL] = []
        
        if let url = url {
            urlToShare.append(url)
        }
        
        let activityVC = UIActivityViewController(activityItems: urlToShare, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct ActionSheetButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetButton()
    }
}
