//
//  DailyFlowerService.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 21/12/21.
//

import Foundation

struct DailyFlowerService {
    static let shared = DailyFlowerService()
    
    private let flowers = ["pink primrose", "hard-leaved pocket orchid", "canterbury bells", "english marigold", "moon orchid", "monkshood", "globe thistle", "snapdragon", "king protea", "spear thistle", "yellow iris", "globe-flower",
                   "purple coneflower", "peruvian lily", "balloon flower", "giant white arum lily", "fritillary", "red ginger", "grape hyacinth", "corn poppy", "artichoke", "sweet william", "carnation", "garden phlox",
                   "mexican aster", "alpine sea holly", "siam tulip", "lenten rose", "barberton daisy", "daffodil", "sword lily", "poinsettia", "bolero deep blue", "wallflower", "buttercup", "oxeye daisy", "common dandelion",
                   "petunia", "wild pansy", "primula", "sunflower", "pelargonium", "gaura", "geranium", "cautleya spicata", "japanese anemone", "californian poppy", "osteospermum", "spring crocus", "bearded iris", "gazania",
                   "azalea", "rose", "morning glory", "passion flower", "lotus flower", "toad lily", "anthurium", "frangipani", "clematis", "hibiscus", "columbine flower", "adenium", "tree mallow", "magnolia", "cyclamen",
                   "watercress", "canna lily", "hippeastrum", "bee balm", "ball moss", "foxglove", "bougainvillea", "camellia", "mexican petunia", "bromelia", "blanket flower", "trumpet creeper", "blackberry lily"
    ]
    
    var dailyFlower: String {
        flowers.randomElement()!
    }
        
}
