//
//  ChooseFirstDetailInformation.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/11.
//

import SwiftUI

struct ChooseFirstDetailInformation: View {
    @State var isTapped: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false]

    @Binding var firstIsTappedNumber: Int
    @Binding var firstIsSelected: Bool

    
    func readyToGetToggle() {
        for index in 0...11 {
            isTapped[index] = false
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 320, height: 500, alignment: .center)
            
            Text("Express your feeling")
                .fontWeight(.regular)
                .frame(width: 255, alignment: .leading)
                .font(.system(size: 20))
                .foregroundColor(Color(red: 20/255, green: 20/255, blue: 20/255))
                .offset(x:0, y:-180)
            
            VStack {
                HStack {
                    ForEach(0..<4) { i in
                        Image("Group \(i)")
                            .opacity(isTapped[i] ? 1.0 : 0.4)
                            .padding(4)
                            .onTapGesture {
                                firstIsSelected = true
                                readyToGetToggle()
                                isTapped[i].toggle()
                                firstIsTappedNumber = i
                            }
                    }
                }

                HStack {
                    ForEach(4..<8) { i in
                        Image("Group \(i)")
                            .opacity(isTapped[i] ? 1.0 : 0.4)
                            .padding(4)
                            .onTapGesture {
                                firstIsSelected = true
                                readyToGetToggle()
                                isTapped[i].toggle()
                                firstIsTappedNumber = i
                            }
                    }
                }
                
                HStack {
                    ForEach(8..<12) { i in
                        Image("Group \(i)")
                            .opacity(isTapped[i] ? 1.0 : 0.4)
                            .padding(4)
                            .onTapGesture {
                                firstIsSelected = true
                                readyToGetToggle()
                                isTapped[i].toggle()
                                firstIsTappedNumber = i
                            }
                    }
                }
            }
        }
    }
}

struct ChooseFirstDetailInformation_Previews: PreviewProvider {
    static var previews: some View {
        DetailFirstPageView()

//        ChooseFirstDetailInformation(firstIsTappedNumber: .constant(0), firstIsSelected: .constant(false))
//            .previewLayout(.fixed(width: 320, height: 500))
    }
}
