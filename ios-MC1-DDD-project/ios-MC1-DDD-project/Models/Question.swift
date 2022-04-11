//
//  Question.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/10.
//

import Foundation

struct Question: Identifiable {
    var id: Int
    var sentence : String
    var category : String

    init(id: Int, sentence: String, category: String) {
        self.id = id
        self.sentence = sentence
        self.category = category
    }
}

extension Question {
    static let sampleQuestions: [Question] = [
        Question(id: 0, sentence: "답변하고 싶은 너만의 질문이 있어?", category: "우울"),
        Question(id: 1, sentence: "오늘 하루는 어땠어?", category: "우울"),
        Question(id: 2, sentence: "오늘은 1~10점 중 몇 점이야?", category: "우울"),
        Question(id: 3, sentence: "1점을 올리려면 어떤걸 해야할까?", category: "우울"),
        Question(id: 4, sentence: "어떤 점이 변하면 이 문제가 해결되었다고 할 수 있을까?", category: "우울"),
        Question(id: 5, sentence: "이 문제가 더 심각해진다면, 어떤게 변할까?", category: "우울"),
        Question(id: 6, sentence: "이 문제를 해결하기 위해 어떤 것들을 시도해볼 수 있을까?", category: "우울"),
        Question(id: 7, sentence: "이 문제가 오래된 문제라고 생각해?", category: "우울"),
    ]
    
    static let sampleSelectedQuestions: [Question] = [
        Question(id: 1, sentence: "오늘 하루는 어땠어?", category: "우울"),
        Question(id: 2, sentence: "오늘은 1~10점 중 몇 점이야?", category: "우울"),
        Question(id: 3, sentence: "1점을 올리려면 어떤걸 해야할까?", category: "우울")
    ]
}
