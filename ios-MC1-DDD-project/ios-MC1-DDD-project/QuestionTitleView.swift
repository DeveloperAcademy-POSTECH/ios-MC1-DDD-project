//
//  questionTitleView.swift
//  DDD_test_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct QuestionTitleView: View {
    @Binding var seedCard: SeedCard
    
    var body: some View {
        Text("오늘의 질문")
            .font(.system(size: 16, weight: .bold))
            .frame(width: 320, height: 40)
            .foregroundColor(Color.white)
            .background(Color(seedCard.seedColor))
    }
}

struct QuestionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTitleView(seedCard: .constant(SeedCard.sampleSeedCard1))
    }
}
