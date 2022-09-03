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
    
    init() {        
        generateDailyFlower()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(modelData)
        }
    }
    
    func generateDailyFlower() {
        let defaults = UserDefaults.standard
        let myTime = Date()
        let myCalendar = Calendar.current
        let currentDay = myCalendar.component(.day, from: myTime)
        
        if defaults.string(forKey: "DailyFlower") == nil {
            setDailyFlower(flowerName: DailyFlowerService.shared.dailyFlower, currentDay: currentDay, for: defaults)
        } else {
            if currentDay != defaults.integer(forKey: "CurrentDay") {
                setDailyFlower(flowerName: DailyFlowerService.shared.dailyFlower, currentDay: currentDay, for: defaults)
            }
        }
    }
    
    private func setDailyFlower(flowerName: String, currentDay: Int, for defaults: UserDefaults) {
        defaults.set(flowerName, forKey: "DailyFlower")
        defaults.set(currentDay, forKey: "CurrentDay")
    }
}
