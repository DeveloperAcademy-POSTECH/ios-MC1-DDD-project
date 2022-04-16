//
//  ChooseForthDetailInformation.swift
//  Arcon_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct ChooseFourthDetailInformation: View {
    
    let titleName: String = ""
    @State var test: String = ""
    
    @State var seedname: String = ""
    @State var tag: [String] = ["","",""]
    @State var tag_1: String = ""
    @State var tag_2: String = ""
    @State var tag_3: String = ""
    
    @Binding var firstIsSelected: Bool
    @Binding var isShapeSelected: Bool
    @Binding var isColorSelected: Bool
    @Binding var isNameSelected: Bool
    
    @Binding var currentSeedColor: Int
    
    @Binding var isCreatingDone: Bool
    @Binding var currentSeedName: String
    @Binding var currentSeedKeyword: [String]
    
    @Binding var seedCardObject: SeedCard
    
    @Binding var currentFace: Int
    @Binding var currentShape: Int
    
//    @State var remind = true
    
    var color_text: Color = Color(red: 102/255, green: 102/255, blue: 102/255)
    var color_style: Color = Color(red: 151/255, green: 151/255, blue: 151/255)
    var color_button: Color = Color(red: 136/255, green: 136/255, blue: 136/155)
    
    var body: some View {
        
        
        VStack (alignment: .center, spacing: 50){
            VStack (alignment: .leading){
                Text("씨앗에 이름을 붙여줘")
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(color_text)
                ZStack {
                    HStack {
                        TextField("이름", text: $currentSeedName)
                            .padding(.horizontal)
                            .frame(width: 200, height: 40, alignment: .center)
                            .cornerRadius(13,corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                            .submitLabel(.done)
                            .disableAutocorrection(true)
                            .onChange(of: currentSeedName) {_ in
                                if currentSeedName.count > 0 {
                                    isNameSelected = true
                                }else{
                                    isNameSelected = false
                                }
                            }
                            .keyboardType(.default)
                        
                        Text("씨앗")
                            .font(.system(size: 18))
                            .foregroundColor(color_text)
                            .bold()
                        
                    }
//                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    
                }
                .frame(width: 256, height: 40, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                        .foregroundColor(color_style)
                    //                        Color(red: 40/255, green: 40/255, blue: 40/255)
                )
            }
            
            VStack (alignment: .leading){
                Text("씨앗을 간단하게 설명해줘")
                    .font(.system(size: 20, weight:.bold))
                    .foregroundColor(color_text)
                
                ForEach (0..<3){ index in
                    HStack{
                        Text("#")
                            .font(.system(size: 20))
                            .foregroundColor(color_text)
                        TextField("오늘의 키워드", text: $tag[index])
                            .padding(.horizontal)
                            .disableAutocorrection(true)
                            .frame(height: 40)
                            .disableAutocorrection(true)
                            .overlay(
                                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                                    .foregroundColor(color_style))
                            .submitLabel(.done)
                            .keyboardType(.default)

                    }
                    .frame(width: 256, alignment: .center)
                    
                }
 
            }
//            토글기능 (체크박스 extension필요)
//            HStack(alignment: .top, spacing: 100.0)
//            {
//                Toggle(isOn: $remind)
//                {
//                    Text("나중에 너의 씨앗을 다시 살펴볼까?")
//                        .font(.system(size: 14))
//                        .foregroundColor(Color("darkcolor"))
//                        .bold()
//                }.toggleStyle(CheckboxStyle())
//
//            }
//
//            NavigationLink(destination: FrontCardCompleteView(seedCard: $seedCardObject)
//                .navigationBarHidden(true)
//                .navigationBarBackButtonHidden(true)
//            ) {
//                Image("YesCreateButton")
//            }
            
            Button {
                if(tag[0] != "") {
                    seedCardObject.seedKeyword.append(tag[0])
                }
                if(tag[1] != "") {
                    seedCardObject.seedKeyword.append(tag[1])
                }
                if(tag[2] != "") {
                    seedCardObject.seedKeyword.append(tag[2])
                }
                isCreatingDone = true;
                
            } label: {
                Text("씨앗 완성하기").bold()
            }
            .frame(width: 256, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(firstIsSelected && isShapeSelected && isColorSelected  && isNameSelected ? Color("Color\(currentSeedColor)") : color_style)
            .cornerRadius(15)
            .disabled(!firstIsSelected || !isShapeSelected || !isColorSelected || !isNameSelected)
            
            NavigationLink(isActive: $isCreatingDone) {
                FrontCardCompleteView(seedCard: SeedCard(seedFaceIndex: currentFace, seedShapeIndex: currentShape, seedColorIndex: currentSeedColor, seedName: currentSeedName, seedKeyword: seedCardObject.seedKeyword))
                    .navigationBarHidden(true)
                    .navigationBarTitle("", displayMode: .inline)
            } label: {}
        }
        .padding(30)
        .frame(width: 320, height: 500, alignment: .center)
        .background(Color.white)
        .cornerRadius(15)
        .onAppear(perform : UIApplication.shared.hideKeyboard)
    }
    
}

struct ChooseForthDetailInformation_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFourthDetailInformation(firstIsSelected: .constant(false),isShapeSelected: .constant(false),isColorSelected: .constant(false),isNameSelected: .constant(false), currentSeedColor: .constant(10), isCreatingDone: .constant(false), currentSeedName: .constant("기본이름"), currentSeedKeyword: .constant(["키", "워", "드"]), seedCardObject: .constant(SeedCard.sampleSeedCard1), currentFace: .constant(0), currentShape: .constant(0))
            .previewLayout(.fixed(width: 320, height: 500))
    }
}


