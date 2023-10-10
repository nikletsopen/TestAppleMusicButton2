//
//  ContentView.swift
//  AppleMusicButtonTest2
//
//  Created by Nikita Timonin on 09.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack {
            PlayButton()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlayButton: View {
    enum Constants {
        static let animationDuration = 0.22
    }
    
    @State var isPressed = false
    
    var body: some View {
        Button("") {
            withAnimation(.linear(duration: Constants.animationDuration)) {
                isPressed = true

                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDuration + 0.05) {
                    isPressed = false
                }
            }
        }
        .buttonStyle(PlayButtonStyle(isPressed: isPressed))
    }
}

struct PlayButtonStyle: ButtonStyle {
    let isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        let width = 30.0
        HStack(alignment: .center, spacing: 0.0) {
            Image(systemName: "play.fill")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: isPressed ? width : .zero)
                .opacity(isPressed ? 1 : .zero)
            Image(systemName: "play.fill")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: width)
            Image(systemName: "play.fill")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: isPressed ? .zero : width)
                .opacity(isPressed ? .zero : 1.0)
        }
        .foregroundColor(.blue)
        .padding(32)
        .background(isPressed ? .gray.opacity(0.15) : .clear)
        .clipShape(Circle())
        .scaleEffect(isPressed ? 0.86 : 1.0)
    }
}

struct SlowPlayButton: View {
    enum Constants {
        static let animationDuration = 1.5
    }
    
    @State var isPressed = false
    
    var body: some View {
        Button("") {
            withAnimation(.spring(
                response: Constants.animationDuration,
                dampingFraction: 0.55,
                blendDuration: 0.4)) {
                    isPressed = true
                }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDuration + 0.05) {
                isPressed = false
            }
        }
        .buttonStyle(SlowPlayButtonStyle(isPressed: isPressed))
    }
}

struct SlowPlayButtonStyle: ButtonStyle {
    let isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        let width = 30.0
        HStack(alignment: .center, spacing: 0.0) {
            Image(systemName: "play.fill")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: isPressed ? width : .zero)
                .opacity(isPressed ? 1 : .zero)
            Image(systemName: "play.fill")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: width)
            Image(systemName: "play.fill")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: isPressed ? .zero : width)
                .opacity(isPressed ? .zero : 1.0)
        }
        .foregroundColor(.blue)
        .padding(32)
        .background(isPressed ? .gray.opacity(0.15) : .clear)
        .clipShape(Circle())
        .scaleEffect(isPressed ? 0.0 : 1.0)
    }
}





