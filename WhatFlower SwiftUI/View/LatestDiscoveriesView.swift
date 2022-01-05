//
//  LatestDiscoveriesView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 04/01/22.
//

import SwiftUI

struct LatestDiscoveriesView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(edges: .top)
            
            FlowerList()
                .navigationTitle("Latest Discoveries")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LatestDiscoveriesView_Previews: PreviewProvider {
    static var previews: some View {
        LatestDiscoveriesView()
    }
}
