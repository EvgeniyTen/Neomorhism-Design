//
//  NeomorphModifier.swift
//  Neomorphism Design
//
//  Created by Evgeniy Timofeev on 28.01.2024.
//

import SwiftUI

extension Button {
    func neomorphStyle(_ isAppeared: Bool) -> some View {
        self
            .buttonStyle(NeomorphButtonStyle(isAppeared))
    }
}

struct NeomorphModifier: ViewModifier {
    var isAppeared: Bool
    var isPressed: Bool

    func body(content: Content) -> some View {
        content
            .background(backgroundContent(content: content))
            .animation(.snappy(duration: 0.3, extraBounce: 0.6), value: isAppeared)
            .animation(.easeInOut(duration: 0.15), value: isPressed)

    }
    
    @ViewBuilder
    func backgroundContent(content: Content) -> some View {
        switch isAppeared {
        case true:
            content
                .shadow(color: .black.opacity(0.3),
                        radius: isPressed ? 1 : 5,
                        x: isPressed ? -2 : 5,
                        y: isPressed ? -2 : 5)
                .shadow(color: .white.opacity(0.3),
                        radius: isPressed ? 0 : 5,
                        x: isPressed ? 2 : -5,
                        y: isPressed ? 2 : -5)
                .blur(radius: isPressed ? 2 : 5)
        case false:
            EmptyView()
        }
    }
}
