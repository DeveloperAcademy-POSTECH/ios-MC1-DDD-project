//
//  DiaryView.swift
//  test_main
//
//  Created by Jeon Jimin on 2022/04/10.
//

import SwiftUI

struct DiaryView: View {
    @Binding var questionList: [String]
    let lists = [3, 4, 5, 6]
    @State private var text = ""
//    @State private var q_text_arr = ["질문1","질문2","질문3"]
    
//    init(questionList: [String]) {
//        UITextView.appearance().backgroundColor = .clear
//    }
    
    var body: some View {
        VStack (spacing:20){
            
            Text("")
                .frame(height:0)
            
            VStack (spacing:0){
                
                /*Text("strokeBorder사용").background(.blue)
                example3()*/ //함수 사용해서 하기
                Text("오늘의 질문")
                    .font(.system(size: 16, weight: .bold))
                    .frame(width: 360)
                    .frame(height: 40)
                    .foregroundColor(Color.white)
                    .background(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255).ignoresSafeArea())
                    .cornerRadius(15,corners: [.topLeft, .topRight])
                    .minimumScaleFactor(1.2)
                
                ForEach(questionList, id:\.self) { q_text in
                    Text(q_text)
                        .font(.system(size: 16/*, weight: .bold*/))
                        .frame(width: 360, height: 40)
                        .minimumScaleFactor(0.2)
                }
                
                /*Rectangle() //viewExtension사용해서 코너별 라운드 주기
                    .cornerRadius(25, corners: .bottomRight)
                    .cornerRadius(25, corners: .bottomLeft)
                */
                
            }
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255))
            )

            VStack {
                Spacer()
                TextField("일기 제목", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width:330, height: 40)
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    .padding(.top,10)

                    
                    
                            
                ScrollView {
                    ZStack(alignment: .topLeading) {
                        
                        if text.isEmpty {
                            Text("너의 이야기를 들려줘")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                        }
                        TextEditor(text:$text)
                            .frame(width:330)
                            .padding(.leading,5)
                            .padding(.trailing, 5)
                    }
                    .font(.body)
                    /*TextField("너의 이야기를 들려줘", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .frame(width:330)
                        .padding(.leading,15)
                        .padding(.trailing,15)*/
                        
                }
                
            }
            //.padding(EdgeInsets(top: 20, leading: -10, bottom: 0, trailing: 0))
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255))
            )
            NavigationLink{
//                TestView()
            }label: {
                Text("다음")
            }
        }
        .onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }
        .navigationBarTitle("", displayMode: .inline)
       
    }
    /*func example3() -> some View { //strokeborder 함수 RoundedRectangle(cornerRadius: 8) .strokeBorder(.pink.opacity(0.5), lineWidth: 4) .frame(width: 200, height: 60) .background(.black) }*/
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(questionList: .constant(["오늘 하루는 어땠어?","오늘은 1~10점 중 몇 점이야?","1점을 올리려면 어떤걸 해야할까?"]))
    }
}
