//
//  CameraButton.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 04/11/21.
//

import SwiftUI

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(1)
            .scaleEffect(1)
    }
}

struct CameraButton: View {
    @State var isShowingImagePicker = false
    
    var body: some View {
        Button {
            isShowingImagePicker.toggle()
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 70, height: 70)
                    .shadow(radius: 2)
                Image(systemName: "camera.circle.fill")
                    .resizable()
                    .foregroundColor(Color("ColorGreenAdaptive"))
                    
                    .frame(width: 62, height: 62)
            }.offset(y: -10)
        }
        .buttonStyle(TabButtonStyle())
        .fullScreenCover(isPresented: $isShowingImagePicker) {
            ImagePickerView()
        }
//        .fullScreenCover(isPresented: $isShowingImagePicker) {
//            // Let know our previous View that we effectively found a flower
//        } content: {
//            ImagePickerView()
//        }
        
    }
}
