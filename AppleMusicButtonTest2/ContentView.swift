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
            VStack {
                SlowPlayButton()
                Text("Scale: 0,\nDuration: 1.5")
                    .foregroundColor(.red)

            }
            
            VStack {
                PlayButton()
                Text("Scale: 0.86,\nDuration: 0.22")
                    .foregroundColor(.green)
            }
         
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlayButton: View {
    var body: some View {
        Button("") {
        }
        .buttonStyle(PlayButtonStyle())
    }
}

struct PlayButtonStyle: ButtonStyle {
    enum Constants {
        static let animationDuration = 0.22
    }
    
    @State var isPressed = false
    
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
        .onTapGesture {
            withAnimation(.linear(duration: Constants.animationDuration)) {
                isPressed = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDuration + 0.05) {
                    isPressed = false
                }
            }
        }
        .foregroundColor(.blue)
        .padding(32)
        .background(isPressed ? .gray.opacity(0.15) : .clear)
        .clipShape(Circle())
        .scaleEffect(isPressed ? 0.86 : 1.0)
    }
}

struct SlowPlayButton: View {
    var body: some View {
        Button("") {
        }
        .buttonStyle(SlowPlayButtonStyle())
    }
}

struct SlowPlayButtonStyle: ButtonStyle {
    enum Constants {
        static let animationDuration = 1.5
    }
    
    @State var isPressed = false
    
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
        .onTapGesture {
            withAnimation(.linear(duration: Constants.animationDuration)) {
                isPressed = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDuration + 0.05) {
                    isPressed = false
                }
            }
        }
        .foregroundColor(.blue)
        .padding(32)
        .background(isPressed ? .gray.opacity(0.15) : .clear)
        .clipShape(Circle())
        .scaleEffect(isPressed ? 0.0 : 1.0)
    }
}





