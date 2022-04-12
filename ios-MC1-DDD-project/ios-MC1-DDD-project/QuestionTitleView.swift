//
//  questionTitleView.swift
//  DDD_test_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct QuestionTitleView: View {
    var body: some View {
        Text("오늘의 질문")
            .font(.system(size: 16, weight: .bold))
            .frame(width: 290, height: 40)
            .foregroundColor(Color.white)
            .background(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255))
    }
}

struct QuestionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTitleView()
    }
}
