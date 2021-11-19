//
//  FlowerData.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 18/11/21.
//

import Foundation

struct FlowerData: Decodable {
    let query: Query
}

struct Query: Decodable {
    let pageids: [String]
    let pages: [Int:Pages]
}

struct Pages: Decodable {
    let title: String
    let extract: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Decodable {
    let source: String
}
