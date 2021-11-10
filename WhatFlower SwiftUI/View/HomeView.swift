//
//  HomeView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 23/10/21.
//

import SwiftUI

struct HomeView: View {
    
    var userHasRecentFlowers = false
    
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
                                if userHasRecentFlowers {
                                    Button(action: { print("Show latest discoveries screen")} ) {
                                        Text("See all")
                                            .font(Font.system(size: 14, weight: .regular))
                                            .foregroundColor(.secondary)
                                    }
                                }
                                
                            }.padding(.top, 24.0)

                            if userHasRecentFlowers {
                                HStack {
                                    ImageView(width: (proxy.size.width / 2) - 16)
                                    ImageView(width: (proxy.size.width / 2) - 16)
                                }
                            } else {
                                VStack {
                                    // TODO: Implement empty sate
                                    
                                    Image("empty_flower")
                                        .resizable()
                                        .frame(width: 150, height: 200)
                                    
                                    VStack {
                                        Text("No Flowers!")
                                            .font(.system(size: 20.0, weight: .bold))
                                            .padding(.top, 12.0)
                                        Text("Start looking for flowers by tapping the green button below")
                                            .foregroundColor(.secondary)
                                            .font(.system(size: 14.0))
                                            .multilineTextAlignment(.center)
                                            .lineLimit(nil)
                                            .frame(minHeight: 40.0)
                                    }
                                    .padding(.horizontal, 40.0)
                                }.padding(.top, 24.0)
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
        HomeView()
    }
}
