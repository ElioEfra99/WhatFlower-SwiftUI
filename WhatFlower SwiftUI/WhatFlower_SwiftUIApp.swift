//
//  WhatFlower_SwiftUIApp.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 23/10/21.
//

import SwiftUI

@main
struct WhatFlower_SwiftUIApp: App {
    init() {
        showFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func showFonts() {
        for fontFamily in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
                print("\(fontName)")
            }
        }
    }
}
