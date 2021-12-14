//
//  Flower.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 22/11/21.
//

import Foundation

struct Flower: Codable {
    let title: String
    let extract: String
    let imageURL: URL
    var isFavorite: Bool = false
}
