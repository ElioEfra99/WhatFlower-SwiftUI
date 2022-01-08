//
//  DailyFlowerViewModel.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 23/12/21.
//

import Foundation
import Combine
import SwiftUI

final class DailyFlowerViewModel: ObservableObject {
    
    init() {
        fetchDailyFlower()
    }
    
    @Published var dailyFlower = Flower(id: 0, title: "", extract: "", imageURL: URL(string: "wikipedia.org")!, tag: "") {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchDailyFlower() {
        let defaults = UserDefaults.standard
        
        if let flowerString = defaults.string(forKey: "DailyFlower") {
            FlowerService().getDailyFlower(flowerString) { flower in
                DispatchQueue.main.async {
                    self.dailyFlower = flower
                }
            }
        }
    }
    
    let didChange = PassthroughSubject<DailyFlowerViewModel, Never>()
}
