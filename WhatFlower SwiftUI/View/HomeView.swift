//
//  HomeView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 23/10/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ZStack {
                    Color("BackgroundColor")
                        .ignoresSafeArea(edges: .top)
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Flower of the day")
                                .font(.system(size: 18.0, weight: .medium))
                                .padding(.top, 24.0)

                            ImageView(width: proxy.size.width - (proxy.size.width / 3))

                            HStack {
                                Text("Latest discoveries")
                                    .font(Font.system(size: 18.0, weight: .medium))
                                Spacer()
                                Button(action: { print("Holaaa")} ) {
                                    Text("See all")
                                        .font(Font.system(size: 14, weight: .regular))
                                        .foregroundColor(.secondary)
                                }
                            }.padding(.top, 24.0)

                            HStack {
                                ImageView(width: (proxy.size.width / 2) - 16)
                                ImageView(width: (proxy.size.width / 2) - 16)
                            }
                            
                            Spacer(minLength: 40)

                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .padding(.horizontal)
                        
                    }
                }
                .navigationTitle("WhatFlower?")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13"], id: \.self) { deviceName in
            HomeView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
