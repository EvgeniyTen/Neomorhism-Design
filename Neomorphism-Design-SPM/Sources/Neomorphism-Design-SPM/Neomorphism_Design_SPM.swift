// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 15, *)
public extension Button {
    func neomorphStyle(isAppeared: Bool = true,
                       shadowColor: Color = .black,
                       glareColor: Color = .white,
                       opacityValue: CGFloat = 0.5

    ) -> some View {
        self
            .buttonStyle(NeomorphButtonStyle(isAppeared: isAppeared,
                                             shadowColor: shadowColor,
                                             glareColor: glareColor,
                                             opacityValue: opacityValue))
    }
}

@available(iOS 15, *)
struct NeomorphModifier: ViewModifier {
    var isAppeared: Bool
    var isPressed: Bool
    var shadowColor: Color
    var glareColor: Color
    var opacityValue: CGFloat
    
    init(isAppeared: Bool,
         isPressed: Bool,
         shadowColor: Color,
         glareColor: Color,
         opacityValue: CGFloat) {
        self.isAppeared = isAppeared
        self.isPressed = isPressed
        self.shadowColor = shadowColor
        self.glareColor = glareColor
        self.opacityValue = opacityValue
    }

    func body(content: Content) -> some View {
        content
            .background(
                backgroundContent(content: content)
            )
            .animation(.snappy(duration: 0.3, extraBounce: 0.6), value: isAppeared)
            .animation(.easeInOut(duration: 0.15), value: isPressed)
    }
    
    @ViewBuilder
    func backgroundContent(content: Content) -> some View {
        switch isAppeared {
        case true:
            TimelineView(.animation) { context in
                content
                    .shadow(color: shadowColor.opacity(opacityValue),
                            radius: isPressed ? 1 : 5,
                            x: isPressed ? -2 : 5,
                            y: isPressed ? -2 : 5)
                    .shadow(color: glareColor.opacity(opacityValue),
                            radius: isPressed ? 0 : 5,
                            x: isPressed ? 2 : -5,
                            y: isPressed ? 2 : -5)
                    .blur(radius: isPressed ? 1 : 10)
            }

        case false:
            EmptyView()
        }
    }
}
