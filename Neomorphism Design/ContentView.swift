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
        .neomorphStyle(isAppeared)
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
        .neomorphStyle(isAppeared)
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
        .neomorphStyle(isAppeared)
    }
}

#Preview {
    ContentView()
}

