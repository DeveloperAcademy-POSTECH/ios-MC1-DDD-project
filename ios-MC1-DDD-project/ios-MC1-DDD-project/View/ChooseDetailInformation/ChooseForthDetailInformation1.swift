//
//  ChooseForthDetailInformation.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/12.
//

import SwiftUI

struct ChooseForthDetailInformation1: View {
    @State private var score = 0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 320, height: 500, alignment: .center)
            
            VStack {
                Text("씨앗에 이름을 붙여줘!")
                    .font(.system(size: 20, weight: .black))
                    .offset(x:-20, y: -20)
                    .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                
                TextField("점수", value: $score, formatter: formatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("당신의 점수는 '\(score)'점 입니다.")
            }
        }
    }
}

struct ChooseForthDetailInformation1_Previews: PreviewProvider {
    static var previews: some View {
        ChooseForthDetailInformation()
            .previewLayout(.fixed(width: 320, height: 500))
    }
}
