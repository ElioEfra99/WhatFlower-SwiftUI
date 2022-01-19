//
//  DailyFlowerService.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 21/12/21.
//

import Foundation

struct DailyFlowerService {
    static let shared = DailyFlowerService()
    
    private let flowers = ["pink primrose", "hard-leaved pocket orchid", "canterbury bells", "Lathyrus", "english marigold", "Lilium lancifolium", "moon orchid", "Strelizia", "monkshood", "globe thistle", "snapdragon",
                           "Tussilago farfara", "king protea", "spear thistle", "yellow iris", "globe-flower", "purple coneflower", "peruvian lily", "balloon flower", "giant white arum lily", "Lilium bulbiferum",
                           "Scabiosa", "fritillary", "red ginger", "grape hyacinth", "corn poppy", "Amaranthus hypochondriacus", "Gentiana acaulis", "artichoke", "sweet william", "carnation", "garden phlox",
                           "Nigella damascena", "mexican aster", "alpine sea holly", "Cattleya labiata", "Nerine bowdenii", "Astrantia", "siam tulip", "Helleborus orientalis", "barberton daisy", "Narcissus poeticus",
                           "sword lily", "poinsettia", "bolero deep blue", "Erysimum cheiri", "Tagetes", "buttercup", "oxeye daisy", "Taraxacum", "petunia", "Viola pedunculata", "primula", "sunflower", "pelargonium",
                           "Dahlia 'Bishop of Llandaff'", "Gaura lindheimeri", "geranium", "Dahlia 'Moonfire'", "Dahlia", "cautleya spicata", "japanese anemone", "Rudbeckia hirta", "Convolvulus cneorum", "californian poppy",
                           "osteospermum", "spring crocus", "Iris germanica", "Anemone", "Romneya coulteri", "gazania", "azalea", "Nymphaeaceae", "rose", "Datura", "morning glory", "passion flower", "Nelumbo nucifera",
                           "toad lily", "anthurium", "frangipani", "clematis", "hibiscus", "Aquilegia", "Adenium obesum", "Malva subovata", "magnolia", "cyclamen", "watercress", "canna lily", "hippeastrum", "bee balm",
                           "ball moss", "foxglove", "bougainvillea", "camellia", "Malva sylvestris", "mexican petunia", "bromelia", "blanket flower", "trumpet creeper", "blackberry lily"
    ]
    
    var dailyFlower: String {
        flowers.randomElement()!
    }
        
}
