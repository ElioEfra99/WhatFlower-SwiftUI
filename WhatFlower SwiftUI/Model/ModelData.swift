//
//  ModelData.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 13/12/21.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var flowers = [Flower]()
    
    private let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Flowers.plist")
    
    func saveFlower() {
        guard let dataFilePath = dataFilePath else { return }
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(flowers)
            try data.write(to: dataFilePath)
        } catch {
            print("Saving flowers failed with error: \(error)")
        }
    }
    
    func loadFlowers() {
        guard let dataFilePath = dataFilePath else { return }
        if let data = try? Data(contentsOf: dataFilePath) {
            let decoder = PropertyListDecoder()
            do {
                flowers = try decoder.decode([Flower].self, from: data)
            } catch {
                print("An error ocurred obtaining flowers from device")
            }
        }
    }
    
    func replaceFlowerData(_ flower: Flower) {
        if let index = flowers.firstIndex(where: { $0.id == flower.id }) {
            flowers[index] = flower
        }
    }
}
