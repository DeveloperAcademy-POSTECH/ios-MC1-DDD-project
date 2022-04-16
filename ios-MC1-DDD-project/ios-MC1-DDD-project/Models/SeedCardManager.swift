//
//  SeedCardManager.swift
//  ios-MC1-DDD-project
//
//  Created by Park Sungmin on 2022/04/14.
//

import Foundation
import SwiftUI
import Combine

class SeedCardManager: ObservableObject {
    static let seedCardManager = SeedCardManager()
    
    private init() {}
    
    @Published var seedCardList: [SeedCard] = [
        SeedCard.sampleSeedCard1,
        SeedCard.sampleSeedCard2,
        SeedCard.sampleSeedCard3,
    ]
    
    func appendCard(seedCard: SeedCard) {
        // date Update
        var newSeedCard = SeedCard(seedCard: seedCard)
        seedCardList.append(newSeedCard)
        print("seed card append : \(seedCard.seedName)")
    }
    
    func evolutionComplete(index: Int) -> Bool {
        return seedCardList[seedCardList.count - index - 1].seedIsEvolved
    }
}
