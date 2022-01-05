//
//  FlowerList.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 04/01/22.
//

import SwiftUI

struct FlowerList: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        List{
            ForEach(modelData.flowers) { flower in
                FlowerRow(flower: flower)
            }
        }
    }
}

struct FlowerList_Previews: PreviewProvider {
    static var previews: some View {
        FlowerList()
    }
}
