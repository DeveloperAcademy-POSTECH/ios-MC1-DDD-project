//
//  TestCreatingSeedView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct TestCreatingSeedView: View {
    let titleName: String
    @State var test: String = ""
    @Binding var isSelected: Bool
    
    var body: some View {
        VStack{
            Button(action: {
                isSelected.toggle()
            }) {
                Text(titleName)
                    .font(.system(size: 20, weight: .heavy))
            }
        }
        .frame(width: 300, height: 550, alignment: .center)
        .background(Color.white)
        .cornerRadius(15)
    }
    
    init(_ name: String, isSelected: Binding<Bool>) {
        titleName = name;
        self._isSelected = isSelected
    }
}

struct TestCreatingSeedView_Previews: PreviewProvider {
    static var previews: some View {
        TestCreatingSeedView("오늘 너의 하루는 어땠니?", isSelected: .constant(true))
            .previewLayout(.fixed(width: 300, height: 550))
    }
}
