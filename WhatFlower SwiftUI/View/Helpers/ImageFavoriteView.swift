//
//  ImageFavoriteView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 08/11/21.
//

import SwiftUI

struct ImageFavoriteView: View {
    @State var isFavorite = true
    
    var body: some View {
        ZStack {
            Image("margarita")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        if !isFavorite {
                            Button(action: {
                                isFavorite.toggle()
                            }) {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 30, height: 27)
                                    .foregroundColor(.white)
                                    
                            }.offset(x: -20, y: 20)
                            
                        } else {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 30, height: 27)
                                .foregroundColor(.red)
                                .offset(x: -20, y: 20)
                            Button(action: {
                                isFavorite.toggle()
                            }) {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 30, height: 27)
                                    .foregroundColor(.white)
                                    
                            }.offset(x: -20, y: 20)
                        }
                    }
                }
                
                Spacer()
                
                Rectangle()
                    .frame(width: .infinity, height: 40)
                    .foregroundColor(Color("ColorBlackTransparentLight"))
                    .overlay(
                        HStack {
                            Text("Margarita")
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
        ImageFavoriteView()
            .previewLayout(.sizeThatFits)
    }
}
