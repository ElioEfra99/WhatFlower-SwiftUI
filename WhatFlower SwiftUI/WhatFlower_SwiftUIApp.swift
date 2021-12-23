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
    let defaults = UserDefaults.standard
    
    init() {
        
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
        
        let myTime = Date()
        let myCalendar = Calendar.current
        let currentDay = myCalendar.component(.day, from: myTime)
        
        if defaults.string(forKey: "DailyFlower") == nil {
            defaults.set(DailyFlowerService.shared.dailyFlower, forKey: "DailyFlower")
            defaults.set(currentDay, forKey: "CurrentDay")
        } else {
            if currentDay != defaults.integer(forKey: "CurrentDay") {
                defaults.set(DailyFlowerService.shared.dailyFlower, forKey: "DailyFlower")
                defaults.set(currentDay, forKey: "CurrentDay")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(modelData)
        }
    }
}
