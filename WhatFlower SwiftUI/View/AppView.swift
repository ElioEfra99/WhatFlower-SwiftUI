//
//  AppView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 03/11/21.
//

import SwiftUI

struct AppView: View {
    @StateObject var flower = FlowerObject()
    @EnvironmentObject var modelData: ModelData
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
            guard let url = flower.imageURL else { return }
            let flowerToSave = Flower(title: flower.title, extract: flower.extract, imageURL: url)
            modelData.flowers.append(flowerToSave)
            clearFlowerObject()
            modelData.saveFlower()
        } content: {
            FlowerResultView()
        }
        .environmentObject(flower)
    }
    
    func clearFlowerObject() {
        flower.title = ""
        flower.extract = ""
        flower.imageURL = URL(string: "")
        foundFlower = false
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
