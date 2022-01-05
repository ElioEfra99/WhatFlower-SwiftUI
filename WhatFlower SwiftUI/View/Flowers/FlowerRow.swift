//
//  FlowerRow.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 04/01/22.
//

import SwiftUI

struct FlowerRow: View {
    var flower: Flower
    var body: some View {
        HStack {
            AsyncImage(url: flower.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading) {
                Text(flower.title)
                    .font(.headline)
                    .padding(.bottom, 4)
                Text(flower.extract)
                    .font(.footnote)
                    .lineLimit(5)
            }
        }
    }
}

struct FlowerRow_Previews: PreviewProvider {
    static var previews: some View {
        FlowerRow(flower: Flower(id: 1, title: "Rose", extract: "A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower A flower", imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Rosa_rubiginosa_1.jpg/350px-Rosa_rubiginosa_1.jpg")!))
    }
}
