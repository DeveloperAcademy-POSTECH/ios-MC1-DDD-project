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
        Question(id: 0, sentence: "Do you think this is an old problem?", category: "우울"),
        Question(id: 1, sentence: "What have you found that is helpful in\n managing this situation?", category: "우울"),
        Question(id: 2, sentence: "On scale of 0 to 10, How serious do \nyou think the problem is now?", category: "우울"),
        Question(id: 3, sentence: "What would it take for you to increase, by just one point?", category: "우울"),
        Question(id: 4, sentence: "What’s the most important thing you have to do to keep things at a 7 or 8?", category: "우울"),
//        Question(id: 5, sentence: "How your best friend will react when you make the changes we talked about?", category: "우울"),
//        Question(id: 6, sentence: "What will be the first thing you notice that would tell you that a miracle has happened, that things are different?", category: "우울"),
        Question(id: 6, sentence: "What’s the first step that you can take to begin to make this miracle happen?", category: "우울"),
    ]
    
    static let sampleSelectedQuestions: [Question] = [
        Question(id: 1, sentence: "오늘 하루는 어땠어?", category: "우울"),
        Question(id: 2, sentence: "오늘은 1~10점 중 몇 점이야?", category: "우울"),
        Question(id: 3, sentence: "1점을 올리려면 어떤걸 해야할까?", category: "우울")
    ]
}
