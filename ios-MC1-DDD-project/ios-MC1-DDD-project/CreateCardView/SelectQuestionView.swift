//
//  SelectQuestionView.swift
//  ios-MC1-DDD-project
//
//  Created by Park Sungmin on 2022/04/12.
//

import SwiftUI

struct SelectQuestionView: View {
    @State var questionList: [Question]
    @State private var selectedQuestion: [Bool] = [false, false, false, false, false, false, false, false]
    @State private var selectedQuestionNumber: Int = 0
    
    @State var passQuestionList: [String] = []
    @State var tempQuestionList: [String] = []
    
    var body: some View {
        VStack {
            Text("답하고 싶은\n질문을 골라봐")
                .fontWeight(.heavy)
                .padding(.top, 30.0)
                .padding(.leading, 30.0)
                .padding(.bottom, 30.0)
                .frame(width: 300, alignment: .leading)
                .font(.system(size:20))
            
            VStack(alignment: .center) {
                ForEach(0 ..< questionList.count) { index in
                    Button(action: {
                        if(selectedQuestionNumber == 3) {
                            if(selectedQuestion[index]) {
                                selectedQuestion[index].toggle()
                                selectedQuestionNumber -= 1
                            }
                        } else{
                            selectedQuestion[index].toggle()
                            selectedQuestionNumber += selectedQuestion[index] ? 1 : -1
                        }
                    }) {
                        Text(questionList[index].sentence)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.vertical, 10)
                    }
                    .foregroundColor(Color(red: 104/255, green: 104/255, blue: 104/255))
                    .frame(width: 270)
                    .frame(minHeight: 20)
                    .padding(3)
                    .background(selectedQuestion[index] ? Color(red: 216/255, green: 216/255, blue: 216/255): Color.white)
                    .cornerRadius(15)
                    
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 2)
                    )
                }
                
            }
            Spacer()
            Button(action:{
                for index in 0..<questionList.count {
                    if(selectedQuestion[index]) {
                        tempQuestionList.append(questionList[index].sentence)
                        passQuestionList = tempQuestionList
                        tempQuestionList = []
                        // 다음 View로 passQuestionList: [String] 전달
                        
                    }
                }
            }) {
                Image("MakeBackCardButton")
            }
            .padding(.bottom, 20)
        }
        .frame(width: 320, height: 670, alignment: .center)
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct SelectQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectQuestionView(questionList: Question.sampleQuestions)
            .previewLayout(.fixed(width: 320, height: 670))
        
    }
}
