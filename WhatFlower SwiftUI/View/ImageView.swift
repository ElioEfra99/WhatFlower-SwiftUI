//
//  ImageView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 01/11/21.
//

import SwiftUI

struct ImageView: View {
    
    let width: CGFloat
    
    var body: some View {
        ZStack {
            Image("margarita")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack {
                Spacer()
                Rectangle()
                    .frame(width: width, height: 40, alignment: .leading)
                    .foregroundColor(Color("ColorBlackTransparentLight"))
                    .overlay(Text("Margarita").foregroundColor(Color("ColorGreenLight")).offset(x: -(width / 4)))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
        }
        .frame(width: width, height: width, alignment: .center)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(width: 200)
            .previewLayout(.sizeThatFits)
    }
}
