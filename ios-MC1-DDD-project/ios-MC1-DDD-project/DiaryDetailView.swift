//
//  TestView.swift
//  test_main
//
//  Created by Jeon Jimin on 2022/04/10.
//

import SwiftUI

struct DiaryDetailView: View {
    
    @Binding var textTitle: String
    @Binding var text: String
    @State private var seedColor = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    var body: some View {
        
        
        
        VStack (spacing: 20){
            
            Text("씨앗 카드의 뒷면을 완성했어!")
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top, 100)
                .padding(.leading, 20)
            
            VStack{
                Text(textTitle)
                    .font(.system(size: 20, weight: .heavy))
                    .frame(width:330, height: 40, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .padding(.top,10)
                    .foregroundColor(seedColor)
                ScrollView {
                    Text(text)
                        .frame(maxWidth: 330, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal, 15)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255))
            )
            
            ZStack {
                Button{
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius:15)/*.stroke(lineWidth:2)*/
                            .fill(seedColor)
                            .frame(width: 200, height: 30)
                        Text("홈으로 돌아가기")
                            .font(.system(size: 15, weight: .heavy))
                            .foregroundColor(.white)
                    }
                    
                }
                .frame(width: 200, height: 30)
                .padding(.bottom, 100)
            }
        }
    }
}

struct DiaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailView(textTitle: .constant("오늘의 일기"), text: .constant("오늘은 기분이 메롱"))
    }
}
