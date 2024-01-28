//
//  ContentView.swift
//  Neomorphism Design
//
//  Created by Evgeniy Timofeev on 28.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isAppeared: Bool = false

    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack(spacing: 50) {
                Toggle("", isOn: $isAppeared)
                    .frame(maxWidth: 50)
                circleButton
                capsuleButton
                rectangleButton
            }

        }
    }
}

extension ContentView {
    
    var circleButton: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: "globe")
                    .renderingMode(.template)
                    .imageScale(.large)
                Text("Hello, world!")
            }
            .foregroundStyle(.white)
            .fontWeight(.heavy)
            .padding(50)
            .background {
                Circle()
                    .foregroundColor(.accentColor)
            }
        }
        .buttonStyle(NeomorphStyle(isAppeared: isAppeared))
    }
    
    var capsuleButton: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: "globe")
                    .renderingMode(.template)
                    .imageScale(.large)
                Text("Hello, world!")
                    .fontWeight(.heavy)
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            .background {
                Capsule()
                    .foregroundColor(.accentColor)
            }
        }
        .buttonStyle(NeomorphStyle(isAppeared: isAppeared))
    }
    
    var rectangleButton: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: "globe")
                    .renderingMode(.template)
                    .imageScale(.large)
                Text("Hello, world!")
            }
            .foregroundStyle(.white)
            .fontWeight(.heavy)
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            .background {
                Rectangle()
                    .foregroundColor(.accentColor)
            }
        }
        .buttonStyle(NeomorphStyle(isAppeared: isAppeared))
    }
}

#Preview {
    ContentView()
}

struct NeomorphModifier: ViewModifier {
    var isAppeared: Bool
    var isPressed: Bool
    
    init(_ isAppeared: Bool,
         isPressed: Bool) {
        self.isAppeared = isAppeared
        self.isPressed = isPressed
    }
    
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

struct NoneModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}

struct NeomorphStyle: ButtonStyle {
    var isAppeared: Bool
    
    init(isAppeared: Bool = true) {
        self.isAppeared = isAppeared
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(isAppeared ? 1 : 0.95)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .modifier(NeomorphModifier(isAppeared, isPressed: configuration.isPressed))
    }

}

