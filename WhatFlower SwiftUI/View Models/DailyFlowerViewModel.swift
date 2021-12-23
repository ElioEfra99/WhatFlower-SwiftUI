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
        fetchPosts()
    }
    
    @Published var dailyFlower = Flower(id: 0, title: "", extract: "", imageURL: URL(string: "wikipedia.org")!) {
        didSet {
            didChange.send(self)
            print("Daily flower now contains: \(dailyFlower)")
        }
    }
    
    private func fetchPosts() {
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
