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
    
    @Binding var seedCard: SeedCard
    @Binding var isSelectingDone: Bool
    
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
                            .frame(width: 260, alignment: .center)
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
            
//            NavigationLink(destination: BackCardMakingView(seedCard: seedCard)
//                .navigationBarHidden(true)
//                .navigationBarBackButtonHidden(true)
//            ) {
//                Image("MakeBackCardButton")
//            }
//            .onTapGesture {
//                for index in 0..<questionList.count {
//                    if(selectedQuestion[index]) {
//                        tempQuestionList.append(questionList[index].sentence)
//                        passQuestionList = tempQuestionList
//                        tempQuestionList = []
//
//                        seedCard.seedQuestionList = passQuestionList
////                        isSelectingDone = true
//                    }
//                }
//            }
//            .padding(.bottom, 20)
            
            
            Button {
                for index in 0..<questionList.count {
                    if(selectedQuestion[index]) {
                        passQuestionList.append(questionList[index].sentence)
                    }
                }
                seedCard.seedQuestionList = passQuestionList
                passQuestionList = []
                isSelectingDone = true
            } label: {
                Text("일기 쓰고 뒷면 완성하기")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 275, height: 48)
            }
            .frame(width: 280, height: 48)
            .foregroundColor(selectedQuestionNumber==0 ? Color.init(red: 136/255, green: 136/255, blue: 136/255): Color.white)
            .background(selectedQuestionNumber==0 ? Color.init(red: 233/255, green: 233/255, blue: 233/255) : Color(seedCard.seedColor))
            .cornerRadius(40)
            .padding(.bottom, 20)
            .disabled(selectedQuestionNumber == 0)
            
            
//            Button(action:{
//                for index in 0..<questionList.count {
//                    if(selectedQuestion[index]) {
//                        passQuestionList.append(questionList[index].sentence)
//
//
//                    }
//                }
//                seedCard.seedQuestionList = passQuestionList
//                passQuestionList = []
//                isSelectingDone = true
//
//            }) {
//                Image("MakeBackCardButton")
//            }
//            .padding(.bottom, 20)
            
        }
        .frame(width: 320, height: 670, alignment: .center)
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct SelectQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectQuestionView(questionList: Question.sampleQuestions, seedCard: .constant(SeedCard.sampleSeedCard1), isSelectingDone: .constant(false))
            .previewLayout(.fixed(width: 320, height: 670))
        
    }
}
