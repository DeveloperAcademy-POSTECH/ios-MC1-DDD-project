//
//  DiaryView.swift
//  test_main
//
//  Created by Jeon Jimin on 2022/04/10.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct DiaryView: View {
    @Binding var questionList: [String]
    
    init(questionList: Binding<[String]>) {
        UITextView.appearance().backgroundColor = .clear
        self._questionList = questionList
    }
    
    @State private var textTitle = ""
    @State private var text = ""
    
    @State private var isfold: Bool = false
    
    var body: some View {
        VStack { //VStack_0
            VStack (spacing: 0){ //VStack_1
                
                VStack (spacing: 0){//VStack_2
                    Button {
                        if(self.isfold){
                            isfold = false
                        }else{
                            isfold = true
                        }
                    }label: {
                        if(self.isfold){
                            QuestionTitleView()
                                .cornerRadius(13,corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        }else{
                            QuestionTitleView()
                                .cornerRadius(15,corners: [.topLeft, .topRight])
                        }
                        
                    }
                    
                    if(self.isfold){
                        
                    }else{
                        QuestionDetailView(questionList: $questionList)
                    }
                } //VStack_2
            }//VStack_1
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255))
            )
            .padding(.top, 15)

            Spacer()
            
            VStack { //VStack_3
                Spacer()
                TextField("일기 제목", text: $textTitle)
//                {
//                    UIApplication.shared.endEditing()
//                }
                .font(.system(size: 20, weight: .bold))
                .frame(width:260, height: 40)
                .padding(.leading,15)
                .padding(.trailing,15)
                .padding(.top,10)
                .onTapGesture {
                    self.isfold = true
                    print("onTapGesture")
                }

                ScrollView {
                    ZStack(alignment: .topLeading) {
                        
                        if text.isEmpty {
                            Text("너의 이야기를 들려줘")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                        }
                        TextEditor(text:$text)
                            .frame(maxWidth:260, maxHeight: .infinity)
                            .padding(.leading,5)
                            .padding(.trailing, 5)
                            .onTapGesture {
                                self.isfold = true
                            }
                    }
                    .font(.body)
                } //ScrollView
                
                // TagView(tagTests: []) //간단한 태그기능..
                
                NavigationLink{
                    DiaryDetailView(textTitle: $textTitle, text: $text)
                }label: {
                    Image("saveButton")
                }
                
            } //VStack_3
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255))
            )
            .padding(.bottom, 15)

        }//VStack_0
        .frame(width: 320, height: 700, alignment: .center)
    }

}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(questionList: .constant(["첫 번째 질문", "두 번째 질문", "세 번째 질문"]))
            .previewLayout(.fixed(width: 320, height: 700))
    }
}
