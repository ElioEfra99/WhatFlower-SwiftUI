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
    @State var userHasRecentFlowers = false
    @State var userHasFavorites = false
    
    var filteredFlowers: [Flower] {
        modelData.flowers.filter { flower in
            flower.isFavorite
        }
    }
    
    let not = (!)
    
    var body: some View {
        TabView {
            HomeView(userHasRecentFlowers: $userHasRecentFlowers)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoriteView(userHasFavorites: $userHasFavorites, filteredFlowers: filteredFlowers)
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
            let flowerToSave = Flower(id: flower.id, title: flower.title, extract: flower.extract, imageURL: url, isFavorite: flower.isFavorite)
            // When flower exists, after detecting it again and marking it as favorite, it should be updated, not ignored
            if modelData.flowers.contains(where: { $0.id == flowerToSave.id } ) {
                modelData.replaceFlowerData(flowerToSave)
            } else {
                modelData.flowers.append(flowerToSave)
            }
            
            updateUserHasFlowers()
            updateUserHasFavorites()
            clearFlowerObject()
            modelData.saveFlower()
        } content: {
            FlowerResultView()
        }
        .environmentObject(flower)
        .onAppear {
            modelData.loadFlowers()
            updateUserHasFlowers()
            updateUserHasFavorites()
        }
    }
    
    func clearFlowerObject() {
        flower.title = ""
        flower.extract = ""
        flower.imageURL = URL(string: "")
        flower.isFavorite = false
        flower.id = 0
        foundFlower = false
    }
    
    func updateUserHasFlowers() {
        if not(modelData.flowers.isEmpty) {
            userHasRecentFlowers = true
        }
    }
    
    func updateUserHasFavorites() {
        userHasFavorites = not(filteredFlowers.isEmpty) ? true : false
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
