//
//  DetailView.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/10.
//

import SwiftUI

struct DetailFirstPageView: View {
    var makingSeedChar: [Image] = []
    @State var currentFace: Int = 12
    @State var currentShape: Int = 9
    @State var currentSeedColor: Int = 10
    @State var currentPageIndex: CGFloat = 3
    
    // 엘리 작업
    @State var firstIsSelected = false //표정선택
    @State var isShapeSelected = false
    @State var isColorSelected = false
    @State var isNameSelected = false
    
    // 레드 작업
    @State var isAllSelected = false
    @State var currentSeedName: String = ""
    @State var currentSeedKeyword: [String] = ["","",""]
    @State var isCreatingDone: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    static let dateformat: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.DD."
        return formatter
    }()

    
//    @Binding var showSeedCreateModal: Bool
    @State var seedCard: SeedCard = SeedCard(seedFaceIndex: 12, seedShapeIndex: 9, seedColorIndex: 10, seedName: "", seedKeyword: [])
        
    var body: some View {
        NavigationView{
            ZStack {
                Color("Color").edgesIgnoringSafeArea(.all)
              
                VStack(alignment: .leading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()

                    } label: {
//                        Text("홈으로 돌아가기")
                        Label("돌아가기", systemImage: "multiply")
                            .labelStyle(.iconOnly)
                            .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                            .font(.system(size: 36, weight: .light))
                    }
                }.frame(width: 300, height: 730, alignment: .topLeading)
                
                VStack(alignment: .leading) {
                    Text(Date(), formatter: SeedCard.dateFormat)
//                    .foregroundColor(Color(red: 151/255, green: 151/255, blue: 151/255))
                        .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .medium))
                    
                }.frame(width: 300, height: 718, alignment: .top)
                
                
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
                            Image("ShapePNG\(ChooseSecondDetailInformation(secondIsTappedNumber: $currentShape, isShapeSelected: .constant(false)).secondIsTappedNumber)")
                                .renderingMode(.template)
                                .foregroundColor(Color("Color\(currentSeedColor)"))
                                .scaleEffect(1.8)
                            //                            .offset(x: 0, y: -260)
                            
                            Image("ImojiPNG\(ChooseFirstDetailInformation(firstIsTappedNumber: $currentFace, firstIsSelected: $firstIsSelected).firstIsTappedNumber)")
                                .renderingMode(.template)
                                .foregroundColor(currentShape == 9 ? Color.white : Color("darkcolor"))
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
                    .padding(.top, 40)
                    .offset(x: 0, y: -255)
                }
                
                HStack {
                    ForEach(0..<4) { i in
                        if (i % 4 == 0) {
                            ChooseFirstDetailInformation(firstIsTappedNumber: $currentFace, firstIsSelected: $firstIsSelected).scaleEffect(currentPageIndex == 3 ? 1 : 0.93)
                            
                        } else if (i % 4 == 1) {
                            ChooseSecondDetailInformation(secondIsTappedNumber: $currentShape, isShapeSelected: $isShapeSelected).scaleEffect(currentPageIndex == 2 ? 1 : 0.93)
                            
                        } else if (i % 4 == 2) {
                            ChooseThirdDetailInformation(currentSeedColor: $currentSeedColor,isColorSelected: $isColorSelected).scaleEffect(currentPageIndex == 1 ? 1 : 0.93)
                            
                        } else {
                            ChooseFourthDetailInformation(firstIsSelected: $firstIsSelected, isShapeSelected: $isShapeSelected, isColorSelected: $isColorSelected, isNameSelected: $isNameSelected, currentSeedColor: $currentSeedColor, isCreatingDone: $isCreatingDone, currentSeedName: $currentSeedName, currentSeedKeyword: $currentSeedKeyword, seedCardObject: $seedCard, currentFace: $currentFace, currentShape: $currentShape)
                                .scaleEffect(currentPageIndex == 0 ? 1 : 0.93)
                            
                        }
                    }
                }.modifier(ScrollingHStackModifier(items: 4, itemWidth: 320, itemSpacing: 4, currentPageIndex: $currentPageIndex))
                    .padding(.top, 250)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        //        .fullScreenCover(isPresented: $isCreatingDone) {
        //            FrontCardCompleteView(seedCard: .constant(SeedCard(seedFaceIndex: firstIsTappedNumber, seedShapeIndex: secondIsTappedNumber, seedColorIndex: currentSeedColor, seedName: seedCard.seedName, seedKeyword: currentSeedKeyword)))
        //                .onAppear(perform: {dump(seedCard.seedName)})
        //            FrontCardCompleteView(seedCard: .constant(SeedCard.sampleSeedCard))
    }
}


struct DetailFirstPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFirstPageView()
    }
}
