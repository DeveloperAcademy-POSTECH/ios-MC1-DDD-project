//
//  DetailView.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/10.
//

import SwiftUI

struct DetailFirstPageView: View {
    var makingSeedChar: [Image] = []
    @State var firstIsTappedNumber: Int = 12
    @State var secondIsTappedNumber: Int = 9
    @State var currentSeedColor: Int = 10
    @State var currentPageIndex: CGFloat = 3
    
    @State var isFaceSelected = false
    @State var isShapeSelected = false
    @State var isColorSelected = false
    @State var isNameSelected = false
    
    @State var firstIsSelected = false
    
    var body: some View {
        ZStack {
            Color("Color").edgesIgnoringSafeArea(.all)
            
            HStack(){
                
                VStack(){
                    //                            Text("씨앗 만들기")
                    ////                            Text("\(Int(currentPageIndex))")
                    //                                .foregroundColor(.white)
                    //                                .font(.system(size: 20, weight: .heavy))
                    //                                .frame(maxWidth: .infinity, alignment: .leading)
                    //                                .padding(.bottom, 1)
                    
                    Text("")
                        .foregroundColor(.white)
                        .frame(maxWidth: 300, alignment: .center)
                        .font(.system(size:12, weight: .medium))
                        .padding(.top, 16)
                    
                    // 이미지 들어갈 영역
                    // padding 15pt + (씨앗 그림 90pt) + padding 15pt = 120pt
                    ZStack{
                        Image("ShapePNG\(ChooseSecondDetailInformation(secondIsTappedNumber: $secondIsTappedNumber).secondIsTappedNumber)")
                            .renderingMode(.template)
                            .foregroundColor(Color("Color\(currentSeedColor)"))
                            .scaleEffect(1.8)
//                            .offset(x: 0, y: -260)
                        
                        Image("ImojiPNG\(ChooseFirstDetailInformation(firstIsTappedNumber: $firstIsTappedNumber, firstIsSelected: $firstIsSelected).firstIsTappedNumber)")
                            .renderingMode(.template)
                            .foregroundColor(secondIsTappedNumber == 9 ? Color.white : Color("darkcolor"))
                            .offset(x: 0, y: 3)
                            
                    }
                    .frame(width: 100, height: 100, alignment: .center)
                    
                    HStack {
                        
                        Image(firstIsSelected ? "SelectedBar_Selected" : "SelectedBar_NotSelected")
                            .padding(.bottom, (3 == Int(currentPageIndex)) ? 20 : 0)
                        
                        Image(isShapeSelected ? "SelectedBar_Selected" : "SelectedBar_NotSelected")
                            .padding(.bottom, (2 == Int(currentPageIndex)) ? 20 : 0)
                        
                        Image(isColorSelected ? "SelectedBar_Selected" : "SelectedBar_NotSelected")
                            .padding(.bottom, (1 == Int(currentPageIndex)) ? 20 : 0)
                        
                        Image(isNameSelected ? "SelectedBar_Selected" : "SelectedBar_NotSelected")
                            .padding(.bottom, (0 == Int(currentPageIndex)) ? 20 : 0)
                    }
                    .frame(width: 320, height: 30)
                }
                .overlay(
                    RoundedRectangle(cornerRadius:15)
                        .stroke(lineWidth:0.5)
                        .foregroundColor(Color.white)
                )
                .frame(minWidth: 320, minHeight: 140, alignment: .center)
                .padding(10)
                .padding(.top, 10)
                .offset(x: 0, y: -255)
            }

            HStack {
                ForEach(0..<4) { i in
                    if (i % 4 == 0) {
                        ChooseFirstDetailInformation(firstIsTappedNumber: $firstIsTappedNumber, firstIsSelected: $firstIsSelected)
                            .scaleEffect(currentPageIndex == 3 ? 1 : 0.93)
                        
                    } else if (i % 4 == 1) {
                        ChooseSecondDetailInformation(secondIsTappedNumber: $secondIsTappedNumber)                            .scaleEffect(currentPageIndex == 2 ? 1 : 0.93)
                        
                    } else if (i % 4 == 2) {
                        ChooseThirdDetailInformation(currentSeedColor: $currentSeedColor)                            .scaleEffect(currentPageIndex == 1 ? 1 : 0.93)
                        
                    } else {
                        ChooseForthDetailInformation()                            .scaleEffect(currentPageIndex == 0 ? 1 : 0.93)
                        
                    }
                }
            }.modifier(ScrollingHStackModifier(items: 4, itemWidth: 320, itemSpacing: 4, currentPageIndex: $currentPageIndex))
                .padding(.top, 250)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct DetailFirstPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFirstPageView()
    }
}
