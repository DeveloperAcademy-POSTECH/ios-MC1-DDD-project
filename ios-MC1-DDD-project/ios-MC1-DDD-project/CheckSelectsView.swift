//
//  CheckSelectsView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/10.
//

//import SwiftUI
//
//struct CheckSelectsView: View {
//
//    @Binding var seedCard: SeedCard
//
//    var body: some View {
//        NavigationView{
//            VStack{
//                Text("오늘 나랑 아래 질문들에 대해 이야기해보자!")
//                    .multilineTextAlignment(.center)
//                    .font(.title)
//                    .padding(.bottom)
//                Spacer()
//                List {
//                    ForEach(questionList, id: \.self) { question in
//                        Text(question)
//                    }
//                }
//                //                NavigationLink("질문에 답하러 가기", destination: DiaryView(questionList: $questionList))
//                //                    .frame(height: 30)
//                //
//                NavigationLink {
//                    DiaryView(seedCard: $seedCard)
//                } label: {
//                    Text("질문에 답하러 가기")
//                }
//
//            }
//        }
//        .onDisappear() {
//            questionList = []
//        }
//        .navigationBarHidden(true)
//
//    }
//
//}
//
//struct CheckSelectsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckSelectsView(questionList: .constant(["오늘 하루는 어땠어?","오늘은 1~10점 중 몇 점이야?","1점을 올리려면 어떤걸 해야할까?"]))
//    }
//}
