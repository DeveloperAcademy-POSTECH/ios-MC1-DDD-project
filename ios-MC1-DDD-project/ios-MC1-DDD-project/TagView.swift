//
//  TagView.swift
//  Arcon_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct TagView: View {
    
    let titleName: String
    @State var test: String = ""
    @Binding var isSelected: Bool
    
    @State var seedname: String = ""
    @State var remind = true
    
    init(titleName: String, isSelected: Binding<Bool>) {
        self.titleName = titleName
        self._isSelected = isSelected
    }
    
    var color_text: Color = Color(red: 102/255, green: 102/255, blue: 102/255)
    var color_style: Color = Color(red: 151/255, green: 151/255, blue: 151/255)
    var color_button: Color = Color(red: 136/255, green: 136/255, blue: 136/155)
    
    var body: some View {
        VStack (alignment: .center, spacing: 50){
            VStack (alignment: .leading){
                Text(titleName)
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(color_text)
                //                Button(action: {
                //                    isSelected.toggle()
                //                }) {
                //                    Text(titleName)
                //                        .font(.system(size: 20, weight: .heavy))
                //                        .foregroundColor(.black)
                //                }
                ZStack {
                    HStack {
                        TextField("이름", text: $seedname)
                            .padding(.horizontal)
                            .frame(width: 200, height: 40, alignment: .center)
                            .cornerRadius(13,corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        
                        Text("씨앗")
                            .font(.system(size: 18))
                            .foregroundColor(color_text)
                            .bold()
                        
                    }
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    
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
                HStack{
                    MakeWord()
                    MakeWord()
                    MakeWord()
                }
                .frame(width: 256, alignment: .center)
                
                
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
                Button {
                    print("테스트입니다.")
                }label: {
                    Text("씨앗카드 완성하기").bold()
                }
                .frame(width: 200, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(color_style)
                .cornerRadius(15)
                
                
            }
            .padding(30)
            .frame(width: 320, height: 500, alignment: .center)
            .background(Color.white)
            .cornerRadius(15)
            //
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(titleName: "씨앗에 이름을 붙여줘", isSelected: .constant(true))
            .previewLayout(.fixed(width: 320, height: 500))
    }
}

struct MakeWord: View {
    var color_text: Color = Color(red: 102/255, green: 102/255, blue: 102/255)
    var color_style: Color = Color(red: 151/255, green: 151/255, blue: 151/255)
    
    var body: some View {
        HStack {
            Text("#")
                .font(.system(size: 20))
                .foregroundColor(color_text)
            TextField("오늘의 키워드", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
                .frame(width: .infinity, height: 40, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                        .foregroundColor(color_style))
        }
    }
}
