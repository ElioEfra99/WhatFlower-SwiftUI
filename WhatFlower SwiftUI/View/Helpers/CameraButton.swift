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
    
    
    
    var body: some View {
        Button {
            print("Opens UIPickerView")
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
    }
}

struct CameraButton_Previews: PreviewProvider {
    static var previews: some View {
        CameraButton()
    }
}
