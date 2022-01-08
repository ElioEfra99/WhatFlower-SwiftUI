//
//  FlowerModel.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 18/11/21.
//

import Foundation

class FlowerObject: ObservableObject {
    @Published var id: Int
    @Published var title: String
    @Published var extract: String
    @Published var imageURL: URL?
    @Published var isFavorite: Bool = false
    @Published var tag: String
    
    init(title: String = "", extract: String = "", imageURL: URL? = nil, id: Int = 0, tag: String = "") {
        self.title = title
        self.extract = extract
        self.imageURL = imageURL
        self.id = id
        self.tag = tag
    }
}
