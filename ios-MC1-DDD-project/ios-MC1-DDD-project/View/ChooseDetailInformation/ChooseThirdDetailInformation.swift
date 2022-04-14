//
//  ChooseThirdDetailInformation.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/12.
//

import SwiftUI

struct ChooseThirdDetailInformation: View {
    @State var isTapped: [Bool] = [false, false, false, false, false, false, false, false, false, false]
    @Binding var currentSeedColor: Int
    @Binding var isColorSelected: Bool
    
    func readyToGetToggle() {
        for index in 0...9 {
            isTapped[index] = false
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 320, height: 500, alignment: .center)
            
            VStack {
                Text("그 감정은 무슨 색이였니?")
                    .font(.system(size: 20, weight: .black))
                    .offset(x:-20, y: -105)
                    .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                
                HStack {
                    ForEach(0..<5) { i in
                        ZStack {
                            Image("Circle \(i)")
                            
                                .padding(4)
                                .onTapGesture {
                                    isColorSelected = true
                                    readyToGetToggle()
                                    isTapped[i].toggle()
                                    currentSeedColor = i
                                }
                            Image("ColorPicker")
                                .opacity(isTapped[i] ? 1.0 : 0)
                        }
                        
                        
                    }
                }
                
                HStack {
                    ForEach(5..<10) { i in
                        ZStack {
                            Image("Circle \(i)")
                                
                                .padding(4)
                                .onTapGesture {
                                    isColorSelected = true
                                    readyToGetToggle()
                                    isTapped[i].toggle()
                                    currentSeedColor = i
                                }
                            
                            Image("ColorPicker")
                                .opacity(isTapped[i] ? 1.0 : 0)
                        }
                    }
                }
                
                Image(systemName: "plus.circle")
                    .font(.system(size: 40, weight: .thin))
                    .padding()
                    .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
            }
        }
    }
}

struct ChooseThirdDetailInformation_Previews: PreviewProvider {
    static var previews: some View {
        ChooseThirdDetailInformation(currentSeedColor: .constant(0), isColorSelected: .constant(false))
            .previewLayout(.fixed(width: 320, height: 500))
    }
}
