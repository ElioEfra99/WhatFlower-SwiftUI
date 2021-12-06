//
//  FavoriteView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 03/11/21.
//

import SwiftUI

struct FavoriteView: View {
    var userHasFavorites = true
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(edges: .top)
                
                if userHasFavorites {
                    ScrollView {
                        LazyVGrid(columns: layout, spacing: 20.0) {
                            ImageFavoriteView()
                            ImageFavoriteView()
                            ImageFavoriteView()
                            ImageFavoriteView()
                            ImageFavoriteView()
                        }
                        .padding(.horizontal)
                        .padding(.top, 24.0)
                    }
                } else {
                    VStack {
                        Image(systemName: "heart.slash")
                            .resizable()
                            .frame(width: 150, height: 140)
                            .foregroundColor(.red)
                        VStack {
                            Text("No Favorites!")
                                .font(.system(size: 20.0, weight: .bold))
                                .padding(.top, 12.0)
                            Text("To add some favorites just tap the heart icon when looking for new or recent flowers")
                                .foregroundColor(.secondary)
                                .font(.system(size: 14.0))
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .frame(minHeight: 40.0)
                        }
                        .padding(.horizontal, 40.0)
                    }.padding(.top, 24.0)
                }
                
                
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
