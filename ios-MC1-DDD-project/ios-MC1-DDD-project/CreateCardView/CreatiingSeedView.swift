//
//  SwiftUIView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct CreatingSeedView: View {
    @State var currentPageIndex: CGFloat = 3.0;
    
    @State var isFaceSelected = false;
    @State var isShapeSelected = false;
    @State var isColorSelected = false;
    @State var isNameSelected = false;
    
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            
            
            VStack{
                ZStack{
                    
                    
                    HStack(spacing: 0){
                        
                        VStack(alignment: .center){
                            //                            Text("씨앗 만들기")
                            ////                            Text("\(Int(currentPageIndex))")
                            //                                .foregroundColor(.white)
                            //                                .font(.system(size: 20, weight: .heavy))
                            //                                .frame(maxWidth: .infinity, alignment: .leading)
                            //                                .padding(.bottom, 1)
                            
                            Text("2022.04.11.")
                                .foregroundColor(.white)
                                .frame(maxWidth: 300, alignment: .center)
                                .font(.system(size:12, weight: .medium))
                                .padding(.top, 16)
                            
                            // 이미지 들어갈 영역
                            // padding 15pt + (씨앗 그림 90pt) + padding 15pt = 120pt
                            Rectangle()
                                .frame(width: 100, height: 100)
                                .opacity(70)
                            
                            HStack {
                                
                                Image(isFaceSelected ? "SelectedBar_Selected" : "SelectedBar_NotSelected")
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
                        
                        // 이미지 들어갈 영역
                        // padding 15pt + (씨앗 그림 90pt) + padding 15pt = 120pt
                        //                        Rectangle()
                        //                            .frame(width: 120, height: 170)
                        //                            .opacity(0)
                    }
                    .frame(minWidth: 300, minHeight: 155, alignment: .center)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius:15)
                            .stroke(lineWidth:1.5)
                    .padding(10)
                    
                    
                    
                }
                
                HStack {
                    // 여기에 씨앗 만드는 뷰 연결하기
                    TestCreatingSeedView("1 page", isSelected: $isFaceSelected)
                        .scaleEffect(currentPageIndex == 3 ? 1 : 0.93)
                    TestCreatingSeedView("2 page", isSelected: $isShapeSelected)
                        .scaleEffect(currentPageIndex == 2 ? 1 : 0.93)
                    TestCreatingSeedView("3 page", isSelected: $isColorSelected)
                        .scaleEffect(currentPageIndex == 0 ? 1 : 0.93)
            }
        }
    }
}

struct CreatingSeedView_preview: PreviewProvider {
    static var previews: some View {
        CreatingSeedView()
    }
}
