//
//  FlowerModel.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 18/11/21.
//

import Foundation

class FlowerObject: ObservableObject {
    @Published var title: String
    @Published var extract: String
    @Published var imageURL: URL?
    @Published var isFavorite: Bool = false
    
    init(title: String = "", extract: String = "", imageURL: URL? = nil) {
        self.title = title
        self.extract = extract
        self.imageURL = imageURL
    }
}
