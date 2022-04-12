//
//  ChooseSecondDetailInformation.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/11.
//

import SwiftUI

struct ChooseSecondDetailInformation: View {
    @State var isTapped: [Bool] = [false, false, false, false, false, false, false, false, false]
    
    @Binding var secondIsTappedNumber: Int

    func readyToGetToggle() {
        for index in 0...8 {
            isTapped[index] = false
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 320, height: 500, alignment: .center)
            
            VStack {
                Text("그 감정은 어떻게 생겼어?")
                    .font(.system(size: 20, weight: .black))
                    .offset(x:-40, y: -53)
                    .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                
                HStack {
                    ForEach(0..<3) { i in
                        Image("Second \(i)")
                            .opacity(isTapped[i] ? 1.0 : 0.3)
                            .padding(4)
                            .onTapGesture {
                                readyToGetToggle()
                                isTapped[i].toggle()
                                secondIsTappedNumber = i
                            }
                    }
                }
                
                HStack {
                    ForEach(3..<6) { i in
                        Image("Second \(i)")
                            .opacity(isTapped[i] ? 1.0 : 0.3)
                            .padding(4)
                            .onTapGesture {
                                readyToGetToggle()
                                isTapped[i].toggle()
                                secondIsTappedNumber = i
                            }
                    }
                }
                
                HStack {
                    ForEach(6..<9) { i in
                        Image("Second \(i)")
                            .opacity(isTapped[i] ? 1.0 : 0.3)
                            .padding(4)
                            .onTapGesture {
                                readyToGetToggle()
                                isTapped[i].toggle()
                                secondIsTappedNumber = i
                            }
                    }
                }
            }
        }
    }
}

struct ChooseSecondDetailInformation_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSecondDetailInformation(secondIsTappedNumber: .constant(0))
            .previewLayout(.fixed(width: 320, height: 500))
    }
}
