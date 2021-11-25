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
            ZStack {
                // TODO: Add remaining pieces of UI
                    VStack {
                        ScrollView{
                            AsyncImage(url: flowerObject.imageURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.size.width, height: 350)
                                    .clipped()
                                    .border(.red)
                                    
                                    
                            } placeholder: {
                                Image(systemName: "photo.circle.fill")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                            }
                            VStack(alignment: .leading) {
                                Text(flowerObject.title)
                                    .font(.system(size: 24, weight: .medium))
                                Text(flowerObject.extract)
                            }
                            .padding(.horizontal)
                        }
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .ignoresSafeArea(edges: .top)
                    .border(.green)

                
                VStack {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button {
                            print("Favorite")
                        } label: {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 25, height: 22)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 16)
                    .padding(.horizontal)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        
    }
}

struct FlowerResultView_Previews: PreviewProvider {
    static var data = FlowerObject(title: "Leucanthemum vulgare", extract: "Leucanthemum vulgare, commonly known as the ox-eye daisy, oxeye daisy, dog daisy, marguerite (French: Marguerite commune, \"common marguerite\") and other common names, is a widespread flowering plant native to Europe and the temperate regions of Asia, and an introduced plant to North America, Australia and New Zealand.Leucanthemum vulgare, commonly known as the ox-eye daisy, oxeye daisy, dog daisy, marguerite (French: Marguerite commune, \"common marguerite\") and other common names, is a widespread flowering plant native to Europe and the temperate regions of Asia, and an introduced plant to North America, Australia and New Zealand.", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/400px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg"))
    
    static var previews: some View {
        FlowerResultView()
            .environmentObject(data)
    }
}
