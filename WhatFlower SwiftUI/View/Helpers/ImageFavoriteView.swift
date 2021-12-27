//
//  ImageFavoriteView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 08/11/21.
//

import SwiftUI

struct ImageFavoriteView: View {
    @State var isFavorite = true
    let flower: Flower
    
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
                            isFavorite.toggle()
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
}

struct ImageFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFavoriteView(flower: Flower(id: 1, title: "Rose", extract: "A flower", imageURL: URL(string: "wikipedia.org")!))
            .previewLayout(.sizeThatFits)
    }
}
