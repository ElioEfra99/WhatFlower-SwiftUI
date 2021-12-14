//
//  FlowerService.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 17/11/21.
//

import Foundation

protocol FlowerServiceDelegate {
    func didFindFlower(_ flower: Flower)
    func didFail(with error: Error)
}

struct FlowerService {
    private let wikipediaUrl = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts|pageimages&exintro&explaintext&redirects=1&indexpageids&pithumbsize=350"
    
    var delegate: FlowerServiceDelegate?
    
    func fetchFlower(flowerName: String) {
        if let urlString = "\(wikipediaUrl)&titles=\(flowerName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            performRequest(with: urlString)
        }
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    self.delegate?.didFail(with: error)
                    return
                }
                
                if let safeData = data {
                    if let flower = self.parseJSON(with: safeData) {
                        self.delegate?.didFindFlower(flower)
                    }
                }
            }
            
            task.resume()
        } else {
            print("Non valid url")
        }
        
    }
    
    func parseJSON(with data: Data) -> Flower? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FlowerData.self, from: data)
            let pageID = Int(decodedData.query.pageids[0])!
            let dataPath = decodedData.query.pages[pageID]
            
            if let title = dataPath?.title, let extract = dataPath?.extract, let imageURL = dataPath?.thumbnail.source {
                guard let url = URL(string: imageURL) else { return nil }
                
                let flower = Flower(title: title, extract: extract, imageURL: url)
                return flower
            }
            
        } catch {
            print("Parsing JSON failed with error: \(error)")
        }
        return nil
    }
}
