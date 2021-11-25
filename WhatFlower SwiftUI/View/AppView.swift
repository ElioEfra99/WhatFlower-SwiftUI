//
//  AppView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 03/11/21.
//

import SwiftUI

struct AppView: View {
    @StateObject var flower = FlowerObject()
    @State var foundFlower = false
    
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
        }
        .overlay(
            CameraButton(foundFlower: $foundFlower)
            ,alignment: .bottom
        )
        .accentColor(.green)
        .fullScreenCover(isPresented: $foundFlower) {
            // After dismissing, data from environment object should be wiped out
            // Its current data should be appended to some sort of database
        } content: {
            FlowerResultView()
        }
        .environmentObject(flower)
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
