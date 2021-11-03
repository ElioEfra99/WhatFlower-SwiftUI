//
//  ContentView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 23/10/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Flower of the day")
                        .font(Font.system(size: 18, weight: .medium))
                        .padding(.top, 24.0)
                    
                    // ImageViewDescription
                    
                    ImageView()
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 32.0, trailing: 100))
                        // .frame(width: 250, alignment: .leading)
                        // Have been testing and if using the frame for image width, it brings all items with it to the center and wreaks havoc
                        // Assigning some padding effectively reduces image size, more specifically, reducing 100px the image
                    
                    HStack {
                        Text("Latest discoveries")
                            .font(Font.system(size: 18, weight: .medium))
                        Spacer()
                        Button(action: { print("Holaaa")} ) {
                            Text("See all")
                                .font(Font.system(size: 14, weight: .regular))
                                .foregroundColor(.secondary)
                        }.padding(.trailing, 18.0)
                    }
                    
                    HStack {
                        ImageView()
                        ImageView()
                    }
                    
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .border(Color.red)
            .navigationBarTitle("WhatFlower?")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPod touch (7th generation)", "iPhone 13"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
