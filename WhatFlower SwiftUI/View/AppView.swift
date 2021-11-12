//
//  AppView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 03/11/21.
//

import SwiftUI

struct AppView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }.overlay(
            CameraButton()
            ,alignment: .bottom
        ).accentColor(.green)
// TODO: Present our image found from wikipedia
//            .fullScreenCover(isPresented: $foundFlower) {
//
//            }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13"], id: \.self) { deviceName in
            AppView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}
