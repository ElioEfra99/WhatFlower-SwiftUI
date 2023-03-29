//
//  FlowerResultView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 20/11/21.
//

import SwiftUI

struct FlowerResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var flowerObject: FlowerObject
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView{
                    ZStack {
                        AsyncImage(url: flowerObject.imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.size.width, height: 350)
                                .clipped()
                        } placeholder: {
                            Image(systemName: "photo.circle.fill")
                                .resizable()
                                .frame(width: 300, height: 300)
                        }
                        
                        VStack {
                            HStack {
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "xmark.circle")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                Button {
                                    flowerObject.isFavorite.toggle()
                                } label: {
                                    
                                    if flowerObject.isFavorite {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .frame(width: 22, height: 19)
                                            .foregroundColor(.red)
                                    } else {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .frame(width: 22, height: 19)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .padding(.top, 50)
                            .padding(.horizontal)
                            Spacer()
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(flowerObject.title)
                            .font(.system(size: 24, weight: .medium))
                            .padding(.top, 16)
                        Text(flowerObject.extract)
                            .padding(.top, 16)
                    }
                    .padding(.horizontal)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea(edges: .top)
        }
    }
}

// swiftlint:disable line_length
struct FlowerResultView_Previews: PreviewProvider {
    static var data = FlowerObject(
        title: "Leucanthemum vulgare",
        extract: "Leucanthemum vulgare, commonly known as the ox-eye daisy, oxeye daisy, dog daisy, marguerite (French: Marguerite commune, \"common marguerite\") and other common names, is a widespread flowering plant native to Europe and the temperate regions of Asia, and an introduced plant to North America, Australia and New Zealand.Leucanthemum vulgare, commonly known as the ox-eye daisy, oxeye daisy, dog daisy, marguerite (French: Marguerite commune, \"common marguerite\") and other common names, is a widespread flowering plant native to Europe and the temperate regions of Asia, and an introduced plant to North America, Australia and New Zealand.",
        imageURL:
            URL(
                string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/400px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg"
            ),
        tag:
            "oxeye daisy"
    )
    
    static var previews: some View {
        FlowerResultView()
            .environmentObject(data)
    }
}

// swiftlint:enable line_length
