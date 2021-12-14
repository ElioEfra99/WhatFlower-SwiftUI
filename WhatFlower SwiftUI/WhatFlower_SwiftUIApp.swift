//
//  WhatFlower_SwiftUIApp.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 23/10/21.
//

import SwiftUI

@main
struct WhatFlower_SwiftUIApp: App {
    @StateObject var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(modelData)
        }
    }
}
