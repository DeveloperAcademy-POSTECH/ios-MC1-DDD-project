//
//  DiaryView.swift
//  test_main
//
//  Created by Jeon Jimin on 2022/04/10.
//

import SwiftUI

struct ReminderDiaryView: View {
    
    let seedCardManager = SeedCardManager.seedCardManager
    @State var seedCard: SeedCard
    
    @State private var textTitle = ""
    @State private var text = ""
    
    @State private var saveButtonClicked: Bool = false
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
                            ReminderTitleView(seedCard: $seedCard)
                                .cornerRadius(13,corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        }else{
                            ReminderTitleView(seedCard: $seedCard)
                                .cornerRadius(15,corners: [.topLeft, .topRight])
                        }
                        
                    }
                    
                    if(self.isfold){
                        
                    }else{
                        ReminderDetailView(seedCard: seedCard)
                    }
                } //VStack_2
                .frame(width: 320, alignment: .center)
            }//VStack_1
            .background(.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(seedCard.seedColor))
            )
            .padding(.top, 15)

            Spacer()
            
            VStack { //VStack_3
                Spacer()
                TextField("Write Title", text: $seedCard.seedRetrospectTitle)
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
                }

                ScrollView {
                    ZStack(alignment: .topLeading) {
                        
                        if seedCard.seedRetrospect.isEmpty {
                            Text("Think about it again")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 12)
                        }
                        TextEditor(text: $seedCard.seedRetrospect)
                            .frame(maxWidth:290, maxHeight: .infinity)
                            .lineLimit(20)
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
                
                Button (action: {
                    seedCard.seedIsEvolved = true;
                    seedCardManager.appendCard(seedCard: seedCard)
                    saveButtonClicked = true
                }) {
                    Text("Save")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 300, height: 48)
                    NavigationLink(isActive: $saveButtonClicked) {
                        EvolutionResultView(seedCard: seedCard)
                            .navigationBarHidden(true)
                            .navigationBarTitle("", displayMode:.inline)
                   
                    } label: { }
                }
                .frame(width: 300, height: 48)
                .foregroundColor(seedCard.seedRetrospectTitle=="" || seedCard.seedRetrospect=="" ? Color.init(red: 136/255, green: 136/255, blue: 136/255): Color.white)
                .background(seedCard.seedRetrospectTitle=="" || seedCard.seedRetrospect=="" ? Color.init(red: 233/255, green: 233/255, blue: 233/255) : Color(seedCard.seedColor))
                .cornerRadius(40)
                .padding(.bottom, 10)
                .disabled(seedCard.seedRetrospect.isEmpty || seedCard.seedRetrospectTitle.isEmpty)
            } //VStack_3
            .background(.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(seedCard.seedColor))
            )
            .padding(.bottom, 15)
            

        }//VStack_0
        .frame(width: 310, height: 670, alignment: .center)
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
        
    }

}

struct ReminderDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderDiaryView(seedCard: SeedCard.sampleSeedCard2)
            .previewLayout(.fixed(width: 320, height: 700))
    }
}
