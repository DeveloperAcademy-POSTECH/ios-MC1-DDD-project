//
//  BackCardMakingView.swift
//  ios-MC1-DDD-project
//
//  Created by Park Sungmin on 2022/04/13.
//

import SwiftUI

struct BackCardMakingView: View {
    
    @State var isSelectingDone: Bool = false
    @State var seedCard: SeedCard
    
    var body: some View {
        ZStack {
            Color("Color").edgesIgnoringSafeArea(.all)

            if(!isSelectingDone) {
                SelectQuestionView(questionList: Question.sampleQuestions, seedCard: $seedCard, isSelectingDone: $isSelectingDone)
            } else {
                DiaryView(seedCard: seedCard)
            }
        }
        
    }
}

struct BackCardMakingView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardMakingView(seedCard: SeedCard.sampleSeedCard1)
    }
}
