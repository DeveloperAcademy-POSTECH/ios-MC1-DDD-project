//
//  DiaryView.swift
//  test_main
//
//  Created by Jeon Jimin on 2022/04/10.
//

import SwiftUI


struct DiaryView: View {
    
    
    @State var seedCard: SeedCard
    
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
                            QuestionTitleView(seedCard: $seedCard)
                                .cornerRadius(13,corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        }else{
                            QuestionTitleView(seedCard: $seedCard)
                                .cornerRadius(15,corners: [.topLeft, .topRight])
                        }
                        
                    }
                    
                    if(self.isfold){
                        
                    }else{
                        QuestionDetailView(seedCard: $seedCard)
                    }
                } //VStack_2
                .background(Color.white)
                .cornerRadius(15)
            }//VStack_1
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(seedCard.seedColor))
            )
            .padding(.top, 15)

            Spacer()
            
            VStack { //VStack_3
                Spacer()
                TextField("일기 제목", text: $seedCard.seedDiaryTitle)
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
                        
                        if seedCard.seedDiary.isEmpty {
                            Text("너의 이야기를 들려줘")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                        }
                        TextEditor(text: $seedCard.seedDiary)
                            .frame(maxWidth:260, maxHeight: .infinity)
                            .padding(.leading,5)
                            .padding(.trailing, 5)
                            .onTapGesture {
                                self.isfold = true
                            }
                            .keyboardType(.default)
                    }
                    .font(.body)
                } //ScrollView
                
                // TagView(tagTests: []) //간단한 태그기능..
                
                NavigationLink {
                    BackCardCompleteView(seedCard: seedCard)
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode:.inline)
                } label: {
                    Text("저장하기")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 256, height: 48)
                }
                .frame(width: 256, height: 48)
                .foregroundColor(seedCard.seedDiaryTitle=="" || seedCard.seedDiary=="" ? Color.init(red: 136/255, green: 136/255, blue: 136/255): Color.white)
                .background(seedCard.seedDiaryTitle=="" || seedCard.seedDiary=="" ? Color.init(red: 233/255, green: 233/255, blue: 233/255) : Color(seedCard.seedColor))
                .cornerRadius(40)
                .padding(.bottom, 10)
                .disabled(seedCard.seedDiary.isEmpty || seedCard.seedDiaryTitle.isEmpty)
            } //VStack_3
            .background(Color.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(seedCard.seedColor))
            )
            .padding(.bottom, 15)
            

        }//VStack_0
        .frame(width: 320, height: 670, alignment: .center)
//        .background(Color.white)
        .cornerRadius(15)
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
        
    }

}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(seedCard: SeedCard.sampleSeedCard1)
            .previewLayout(.fixed(width: 320, height: 700))
    }
}
