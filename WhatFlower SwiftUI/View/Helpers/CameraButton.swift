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
    @State private var isShowingImagePicker = false
    @State private var isLoading = false
    @State private var fetchingFailed = false
    @State private var showingAlert = false
    @EnvironmentObject var flower: FlowerObject
    @Binding var foundFlower: Bool
    let not = (!)
    
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
            if not(flower.title.isEmpty) && not(flower.extract.isEmpty) && flower.imageURL != nil {
                foundFlower = true
                return
            }
            
            if fetchingFailed {
                showingAlert = true
            }
        } content: {
            ZStack {
                ImagePickerView(isPresented: $isShowingImagePicker, isLoading: $isLoading, fetchingFailed: $fetchingFailed)
                
                if isLoading {
                    ProgressView()
                        .scaleEffect(2)
                }
            }
        }
        .alert("An error ocurred", isPresented: $showingAlert) {
            Button("Dismiss") { }
        } message: {
            Text("Please make sure you have an active internet connection and try again.")
        }
    }
}
