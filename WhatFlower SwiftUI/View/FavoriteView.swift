//
//  FavoriteView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 03/11/21.
//

import SwiftUI

struct FavoriteView: View {
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(edges: .top)
                
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
                .navigationTitle("Favorites")
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
