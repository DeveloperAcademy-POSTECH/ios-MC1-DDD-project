//
//  questionTitleView.swift
//  DDD_test_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct ReminderTitleView: View {
    @Binding var seedCard: SeedCard
    
    var body: some View {
        Text("오늘의 회고")
            .font(.system(size: 16, weight: .bold))
            .frame(width: 290, height: 40)
            .foregroundColor(Color.white)
            .background(Color(seedCard.seedColor))
    }
}

struct ReminderTitleView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTitleView(seedCard: .constant(SeedCard.sampleSeedCard1))
    }
}
