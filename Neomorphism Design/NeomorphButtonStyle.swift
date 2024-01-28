//
//  NeomorphButtonStyle.swift
//  Neomorphism Design
//
//  Created by Evgeniy Timofeev on 28.01.2024.
//

import SwiftUI

struct NeomorphButtonStyle: ButtonStyle {
    var isAppeared: Bool
    
    init(_ isAppeared: Bool = true) {
        self.isAppeared = isAppeared
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(isAppeared ? 1 : 0.95)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .modifier(NeomorphModifier(isAppeared: isAppeared, isPressed: configuration.isPressed))
    }

}
