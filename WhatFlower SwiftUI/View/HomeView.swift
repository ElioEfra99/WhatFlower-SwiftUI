//
//  HomeView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 23/10/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var userHasRecentFlowers: Bool
    @StateObject var dailyFlowerVM = DailyFlowerViewModel()
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ZStack {
                    Color("BackgroundColor")
                        .ignoresSafeArea(edges: .top)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Flower of the day")
                                .font(.system(size: 18, weight: .medium))
                                .padding(.top, 24)
                            
                            ImageView(width: proxy.size.width - (proxy.size.width / 3), title: dailyFlowerVM.dailyFlower.title, url: dailyFlowerVM.dailyFlower.imageURL)
                            
                            HStack {
                                Text("Latest discoveries")
                                    .font(Font.system(size: 18, weight: .medium))
                                
                                Spacer()
                                
                                if userHasRecentFlowers {
                                    NavigationLink {
                                        LatestDiscoveriesView()
                                    } label: {
                                        Text("See all")
                                            .font(Font.system(size: 14, weight: .regular))
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                            .padding(.top, 24)
                            
                            if userHasRecentFlowers {
                                HStack {
                                    if modelData.flowers.count < 2 {
                                        ImageView(width: (proxy.size.width / 2) - 20, title: modelData.flowers[0].title, url: modelData.flowers[0].imageURL)
                                    } else {
                                        ImageView(width: (proxy.size.width / 2) - 20, title: modelData.flowers[0].title, url: modelData.flowers[0].imageURL)
                                        ImageView(width: (proxy.size.width / 2) - 20, title: modelData.flowers[1].title, url: modelData.flowers[1].imageURL)
                                    }
                                }
                            } else {
                                HStack {
                                    Spacer()
                                    
                                    VStack {
                                        Image("empty_flower")
                                            .resizable()
                                            .frame(width: 150, height: 200)
                                        VStack {
                                            Text("No Flowers!")
                                                .font(.system(size: 20, weight: .bold))
                                                .padding(.top, 12)
                                            Text("Start looking for flowers by tapping the camera button below")
                                                .foregroundColor(.secondary)
                                                .font(.system(size: 14))
                                                .lineLimit(nil)
                                                .multilineTextAlignment(.center)
                                                .padding(.top, 2)
                                        }
                                        .padding(.horizontal, 40)
                                    }
                                    .padding(.top, 24)
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer(minLength: 40)
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationTitle("WhatFlower?")
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(userHasRecentFlowers: .constant(true))
//            .environmentObject(ModelData())
//    }
//}
