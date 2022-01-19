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
    private let tagMapping = ["sweet pea":"Lathyrus", "tiger lily": "Lilium lancifolium", "bird of paradise": "Strelizia", "colt's foot": "Tussilago farfara", "fire lily": "Lilium bulbiferum",
                              "pincushion flower": "Scabiosa", "prince of wales feathers": "Amaranthus hypochondriacus", "stemless gentian": "Gentiana acaulis", "love in the mist": "Nigella damascena",
                              "ruby-lipped cattleya": "Cattleya labiata", "cape flower": "Nerine bowdenii", "great masterwort": "Astrantia", "lenten rose": "Helleborus orientalis",
                              "daffodil": "Narcissus poeticus", "wallflower": "Erysimum cheiri", "marigold": "Tagetes", "common dandelion": "Taraxacum", "wild pansy": "Viola pedunculata",
                              "bishop of llandaff": "Dahlia 'Bishop of Llandaff'", "gaura": "Gaura lindheimeri", "orange dahlia": "Dahlia 'Moonfire'", "pink-yellow dahlia?": "Dahlia",
                              "black-eyed susan": "Rudbeckia hirta", "silverbush": "Convolvulus cneorum", "bearded iris": "Iris germanica", "windflower": "Anemone", "tree poppy": "Romneya coulteri",
                              "water lily": "Nymphaeaceae", "thorn apple": "Datura", "lotus": "Nelumbo nucifera", "columbine": "Aquilegia", "desert-rose": "Adenium obesum", "tree mallow": "Malva subovata",
                              "mallow": "Malva sylvestris"]
    
    var delegate: FlowerServiceDelegate?
    
    func fetchFlower(flowerName: String) {
        let flowerParam = getFlowerParam(flowerName)

        if let urlString = "\(wikipediaUrl)&titles=\(flowerParam)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            performRequest(with: urlString, tag: flowerName)
        }
    }
    
    func getFlowerParam(_ flowerName: String) -> String {
        if let correctTag = tagMapping[flowerName] {
            return correctTag
        }
        return flowerName
    }
    
    private func performRequest(with urlString: String, tag: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    self.delegate?.didFail(with: error)
                    return
                }
                
                if let safeData = data {
                    if let flower = self.parseJSON(with: safeData, tag: tag) {
                        self.delegate?.didFindFlower(flower)
                    }
                }
            }
            
            task.resume()
        } else {
            print("Non valid url")
        }
        
    }
    
    private func parseJSON(with data: Data, tag: String) -> Flower? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FlowerData.self, from: data)
            let pageID = Int(decodedData.query.pageids[0])!
            let dataPath = decodedData.query.pages[pageID]
            
            if let title = dataPath?.title, let extract = dataPath?.extract, let imageURL = dataPath?.thumbnail.source {
                guard let url = URL(string: imageURL) else { return nil }
                
                let flower = Flower(id: pageID, title: title, extract: extract, imageURL: url, tag: tag)
                return flower
            }
            
        } catch {
            print("Parsing JSON failed with error: \(error)")
        }
        return nil
    }
    
    func getDailyFlower(_ flowerName: String, _ completion: @escaping (Flower) -> ()) {
        if let urlString = "\(wikipediaUrl)&titles=\(flowerName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let url = URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                    if let safeData = data {
                        if let flower = self.parseJSON(with: safeData, tag: flowerName) {
                            completion(flower)
                        }
                    }
                }
                
                task.resume()
            } else {
                print("Non valid url")
            }
        }
    }
}
