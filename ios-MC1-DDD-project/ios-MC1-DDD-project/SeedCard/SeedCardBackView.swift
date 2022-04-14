//
//  SeedCardBackView.swift
//  ios-MC1-DDD-project
//
//  Created by Park Sungmin on 2022/04/14.
//

import SwiftUI

struct SeedCardBackView: View {
    let seedCard: SeedCard
    
    init(seedCard: SeedCard) {
        self.seedCard = seedCard
    }
    
    var body: some View {
        ZStack {
            // 배경 카드 구성
            Rectangle()
                .foregroundColor(Color.white)
            
            VStack {
                Text(seedCard.seedIsEvolved ? seedCard.seedRetrospectTitle : seedCard.seedDiaryTitle)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(seedCard.seedColor))
                .frame(width:260, height: 40, alignment: .leading)
                .padding(.leading,15)
                .padding(.trailing,15)
                .padding(.top,10)
                
                Text(seedCard.seedIsEvolved ? seedCard.seedRetrospect : seedCard.seedDiary)
                    .font(.system(size:16, weight: .light))
                    .foregroundColor(Color("Color"))
                    .lineLimit(20)
                    .frame(width: 260, height: 400, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color(seedCard.seedColor), lineWidth: 2))
        .frame(width: 320, height: 500)
    }
}

struct SeedCardBackView_Previews: PreviewProvider {
    static var previews: some View {
        SeedCardBackView(seedCard: SeedCard.sampleSeedCard1)
            .previewLayout(.fixed(width: 320, height: 500))
    }
}
