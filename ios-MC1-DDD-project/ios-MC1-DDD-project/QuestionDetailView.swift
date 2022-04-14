//
//  questionDetailView.swift
//  DDD_test_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct QuestionDetailView: View {
    @Binding var seedCard: SeedCard
    
    var body: some View {
        VStack(spacing:0) {
            ForEach(seedCard.seedQuestionList, id:\.self) { question in
                Text(question)
                    .font(.system(size: 16/*, weight: .bold*/))
                    .frame(width: 320)
                    .frame(minHeight: 20)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 5)
                    .minimumScaleFactor(0.2)
                    .multilineTextAlignment(.center)
                    .background(Color.white)
            }
        }
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(seedCard: .constant(SeedCard.sampleSeedCard1))
    }
}
