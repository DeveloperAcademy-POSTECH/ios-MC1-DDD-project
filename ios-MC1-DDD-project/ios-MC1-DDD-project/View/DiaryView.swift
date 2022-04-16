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
    @State var recallIsTrue: Bool = true

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
                                .cornerRadius(0 ,corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
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
            }//VStack_1
            .frame(width: 320, alignment: .center)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(seedCard.seedColor))
            )

            .padding(.top, 15)

            Spacer()
            
            VStack { //VStack_3
                Spacer()
                TextField("Title", text: $seedCard.seedDiaryTitle)
//                {
//                    UIApplication.shared.endEditing()
//                }
                .font(.system(size: 20, weight: .bold))
                .frame(width:290, height: 40)
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
                            Text("Tell your story")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                        }
                        TextEditor(text: $seedCard.seedDiary)
                            .frame(maxWidth:290, maxHeight: .infinity)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .onTapGesture {
                                self.isfold = true
                            }
                            .keyboardType(.default)
                    }
                    .font(.body)
                } //ScrollView
                
                // TagView(tagTests: []) //간단한 태그기능..
                
                HStack {
//                    Text("Want to remind it?")
//                    Text("Do you want reminder?")
                    Text("Remind this diary later?")
                        .font(.system(size:16, weight: .regular))
                        .foregroundColor(Color("Color"))

                    Label("", systemImage: recallIsTrue ? "checkmark.square" : "square")
//                                    .frame(width:30, height:50, alignment: .trailing)
                        .font(.system(size:20, weight: .regular))
                        .foregroundColor(Color("Color"))
                        .onTapGesture {
                            recallIsTrue.toggle()
                        }
                }
                .padding(3)
                
                NavigationLink {
                    BackCardCompleteView(seedCard: seedCard)
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode:.inline)
                } label: {
                    Text("Save")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 280, height: 48)
                }
                .frame(width: 280, height: 48)
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
        .frame(width: 326, height: 670, alignment: .center)
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
