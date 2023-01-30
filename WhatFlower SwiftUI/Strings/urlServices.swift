//
//  urlServices.swift
//  WhatFlower SwiftUI
//
//  Created by Juan Camilo Rodriguez Betacourt on 30/01/23.
//

struct URLImages {
    
    struct ImagesFrom {
        static let headerUrlCommons = "https://upload.wikimedia.org/wikipedia/commons/thumb/"
        static let headerUrl = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts"
        static let urlImagesVulgare =
        headerUrlCommons + "e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/400px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg"
        static let urlImagesRubiginosa = headerUrlCommons + "e/e6/Rosa_rubiginosa_1.jpg/350px-Rosa_rubiginosa_1.jpg"
        static let urlImagesIntro = headerUrl + "|pageimages&exintro&explaintext&redirects=1&indexpageids&pithumbsize=350"
    }
}
