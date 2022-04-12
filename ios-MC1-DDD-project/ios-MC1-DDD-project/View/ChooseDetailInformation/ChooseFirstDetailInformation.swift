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
            
            VStack {
                Text("오늘 네 하루는 어땠어?")
                    .font(.system(size: 20, weight: .black))
                    .offset(x:-40, y: -90)
                    .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
               
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
        ChooseFirstDetailInformation(firstIsTappedNumber: .constant(0), firstIsSelected: .constant(false))
            .previewLayout(.fixed(width: 320, height: 500))
    }
}
