//
//  ImageFavoriteView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 08/11/21.
//

import SwiftUI

struct ImageFavoriteView: View {
    let flower: Flower
    var flowerIndex: Int {
        modelData.flowers.firstIndex { $0.id == flower.id }!
    }
    @State var isFavorite = true
    @EnvironmentObject var modelData: ModelData
    @Binding var userHasFavorites: Bool
    
    var body: some View {
        ZStack {
            AsyncImage(url: flower.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .scaleEffect(2)
            }
            
            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        Button(action: {
                            unFavoriteFlower()
                        }) {
                            if isFavorite {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 30, height: 27)
                                    .foregroundColor(.red)
                            } else {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 30, height: 27)
                                    .foregroundColor(.white)
                            }
                        }.offset(x: -20, y: 20)
                    }
                }
                
                Spacer()
                
                Rectangle()
                    .frame(height: 40)
                    .foregroundColor(Color("ColorBlackTransparentLight"))
                    .overlay(
                        HStack {
                            Text(flower.title)
                                .foregroundColor(Color("ColorGreenLight"))
                                .offset(x: 20)
                            Spacer()
                        }
                        
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
    
    func unFavoriteFlower() {
        isFavorite.toggle()
        modelData.flowers[flowerIndex].isFavorite = false
        modelData.saveFlower()
        updateUserHasFavorites()
    }
    
    func updateUserHasFavorites() {
        for flower in modelData.flowers {
            if flower.isFavorite {
                userHasFavorites = true
                return
            }
        }
        userHasFavorites = false
    }
}

struct ImageFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFavoriteView(flower: Flower(id: 1, title: "Rose", extract: "A flower", imageURL: URL(string: "wikipedia.org")!, tag: "rose"), userHasFavorites: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
