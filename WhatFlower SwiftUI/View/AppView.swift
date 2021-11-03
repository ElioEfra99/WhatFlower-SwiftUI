//
//  AppView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 03/11/21.
//

import SwiftUI

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(1)
            .scaleEffect(1)
    }
}

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
                }
        }.overlay(
            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70)
                        .shadow(radius: 2)
                    Image(systemName: "camera.circle.fill")
                        .resizable()
                        .foregroundColor(.green)
                        .frame(width: 62, height: 62)
                }.offset(y: -10)
            }
            .buttonStyle(TabButtonStyle())
            ,alignment: .bottom
        )
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPod touch (7th generation)", "iPhone 13"], id: \.self) { deviceName in
            AppView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}
