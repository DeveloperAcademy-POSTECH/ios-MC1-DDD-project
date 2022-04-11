//
//  questionDetailView.swift
//  DDD_test_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct QuestionDetailView: View {
    @Binding var questionList: [String]
    
    var body: some View {
        VStack(spacing:0) {
            ForEach(questionList, id:\.self) { question in
                Text(question)
                    .font(.system(size: 16/*, weight: .bold*/))
                    .frame(width: 360, height: 40)
                    .minimumScaleFactor(0.2)
            }
        }
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(questionList: .constant(["질문1", "질문2", "질문3"]))
    }
}
