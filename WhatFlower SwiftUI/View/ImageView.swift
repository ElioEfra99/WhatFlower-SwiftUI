//
//  ImageView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 01/11/21.
//

import SwiftUI

struct ImageView: View {
    
    let width: CGFloat
    let title: String
    let url: URL?
    
    var body: some View {
        ZStack {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: width, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .scaleEffect(2)
            }
                
            VStack {
                Spacer()
                Rectangle()
                    .frame(width: width, height: 40, alignment: .leading)
                    .foregroundColor(Color("ColorBlackTransparentLight"))
                    .overlay(Text(title).foregroundColor(Color("ColorGreenLight")).offset(x: -(width / 4)))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
        }
        .frame(width: width, height: width, alignment: .center)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(width: 200, title: "", url: URL(string: ""))
            .previewLayout(.sizeThatFits)
    }
}
