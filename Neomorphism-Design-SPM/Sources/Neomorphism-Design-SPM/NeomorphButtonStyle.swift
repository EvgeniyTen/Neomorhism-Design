//
//  File.swift
//  
//
//  Created by Evgeniy Timofeev on 03.02.2024.
//

import SwiftUI

@available(iOS 15, *)
public struct NeomorphButtonStyle: ButtonStyle {
    var isAppeared: Bool
    var shadowColor: Color
    var glareColor: Color
    var opacityValue: CGFloat

    init(isAppeared: Bool,
         shadowColor: Color,
         glareColor: Color,
         opacityValue: CGFloat) {
        self.isAppeared = isAppeared
        self.shadowColor = shadowColor
        self.glareColor = glareColor
        self.opacityValue = opacityValue
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(isAppeared ? 1 : 0.95)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .modifier(NeomorphModifier(isAppeared: isAppeared,
                                       isPressed: configuration.isPressed,
                                       shadowColor: shadowColor,
                                       glareColor: glareColor,
                                       opacityValue: opacityValue))
    }

}
