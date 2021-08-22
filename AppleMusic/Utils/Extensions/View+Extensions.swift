//
//  View+Extensions.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/20/21.
//

import Foundation
import SwiftUI

extension View {
    
    func newOnChange<V:Equatable, T:Equatable, W:Equatable>(of value: (V,T,W), perform action: @escaping (V,T,W) -> Void) -> some View {
        self
    }
    
    func embedInNavigationView() -> some View {
        NavigationView {
            self
        }
    }
    
    func loadingStyle(state isLoading: Bool) -> some View {
        return self
            .modifier(LoadingModifier(state: isLoading))
    }
    
    func relatedMusicView() -> some View {
        VStack(alignment: .leading) {
            Text("Related")
                .font(.title2)
                .bold()
                .padding(.leading, 20)
            self
        }.frame(minHeight: 140)
    }
    
    func cardBorder(cornerRadius: CGFloat) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))

            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.10000000149011612)), lineWidth: 0.5)
        }
        .compositingGroup()
        .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 6)
    }
    
    func cardGradients() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.20000000298023224)))
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(
                        gradient: Gradient(stops: [
                                            .init(color: Color.black.opacity(0.75), location: 0),
                                            .init(color: Color.black.opacity(0.5), location: 0.2),
                                            .init(color: Color.black.opacity(0.25), location: 0.3),
                                            .init(color: Color.clear, location: 0.5)]),
                        startPoint: .bottom,
                        endPoint: .top))
        }
    }
}
