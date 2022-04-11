//
//  SwiftUIView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/10.
//

import SwiftUI

struct QuestionButtonView: View {
    let question: Question
    @State var selected: Bool = false
    @Binding var selectedQuestionCount: Int
    @Binding var selectedQuestionList: [Bool]

    var body: some View {
        HStack(alignment: .center){
            Button(question.sentence) {
                if(selectedQuestionCount < 3) {
                    selectedQuestionCount += (selected ? -1 : 1)
                    selected.toggle()
                    selectedQuestionList[question.id].toggle()
                } else if (selectedQuestionCount == 3) {
                    // 해제만 가능
                    if(selected) {
                        selected.toggle()
                        selectedQuestionList[question.id].toggle()
                        selectedQuestionCount += -1
                    }
                } else {
                    // do none
                }
            }
                .padding()
                .foregroundColor(selected ? .white : .blue)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)

        }
        .background(selected ? Color.blue : Color.white)
        .cornerRadius(10)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionButtonView(question: Question.sampleQuestions[0], selectedQuestionCount: .constant(3), selectedQuestionList: .constant([Bool](repeating:false, count:Question.sampleQuestions.count)))
            .previewLayout(.fixed(width: 400, height: 40))
            
    }
}
