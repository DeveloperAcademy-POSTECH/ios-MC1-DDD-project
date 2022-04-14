//
//  ReminderSelectQuestionView.swift
//  ios-MC1-DDD-project
//
//  Created by Park Sungmin on 2022/04/14.
//

import SwiftUI

struct RetrospectMakingView: View {
    
    @State var isSelectingDone: Bool = false
    @State var seedCard: SeedCard
    
    var body: some View {
        ZStack {
            Color("Color").edgesIgnoringSafeArea(.all)

            if(!isSelectingDone) {
                ReminderSelectQuestionCardView(seedCard: $seedCard, isSelectingDone: $isSelectingDone)
            } else {
                ReminderDiaryView(seedCard: seedCard)
            }
        }
        
    }
}

struct RetrospectMakingView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardMakingView(seedCard: SeedCard.sampleSeedCard1)
    }
}
