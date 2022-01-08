//
//  Flower.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 22/11/21.
//

import Foundation

struct Flower: Identifiable, Codable {
    let id: Int
    let title: String
    let extract: String
    let imageURL: URL
    let tag: String
    var isFavorite: Bool = false
}
