//
//  SeedCardModel.swift
//  ios-MC1-DDD-project
//
//  Created by Park Sungmin on 2022/04/12.
//


//
import Foundation

struct SeedCard : Identifiable {
    let id: UUID
    var seedFaceIndex: Int
    var seedShapeIndex: Int
    var seedColorIndex: Int
    
    var seedFace: String {
        get {
            return "ImojiPNG\(seedFaceIndex)"
        }
    }
    
    var seedShape: String {
        get {
            return "ShapePNG\(seedShapeIndex)"
        }
    }
    
    var treeShape: String {
        get {
            return "treeShape\(seedShapeIndex)"
        }
    }
    
    var seedColor: String {
        get {
            return "Color\(seedColorIndex)"
        }
    }
    
//    var seedName: String = "냥냥씨앗"
    var seedNameOrigin: String = ""

    var seedName: String{
        get {
            if(seedIsEvolved) {
                return "\(self.seedNameOrigin) 나무"
            }
            else {
                return "\(self.seedNameOrigin) 씨앗"
            }
        }

        set(newValue) {
            self.seedNameOrigin = newValue
        }
    }

    var seedKeyword: [String] = ["", "", ""]
    
    var seedCreatedDate: Date
    
    
    var seedQuestionList: [String] = []
    
    var seedDiaryTitle: String = ""
    var seedDiary: String = ""
    
    var seedRetrospectQuestionList: [String] = []
    var seedRetrospectTitle: String = ""
    var seedRetrospect: String = ""
    
    var seedIsEvolved: Bool = false
    
    
    init(id: UUID = UUID(), seedFaceIndex: Int, seedShapeIndex: Int, seedColorIndex: Int, seedName: String, seedKeyword: [String]) {
        self.id = id
        self.seedFaceIndex = seedFaceIndex
        self.seedShapeIndex = seedShapeIndex
        self.seedColorIndex = seedColorIndex
        self.seedKeyword = seedKeyword
        self.seedCreatedDate = Date()
        self.seedName = seedName
    }
    
    init(seedCard: SeedCard) {
        self.id = seedCard.id
        self.seedFaceIndex = seedCard.seedFaceIndex
        self.seedShapeIndex = seedCard.seedShapeIndex
        self.seedColorIndex = seedCard.seedColorIndex
        self.seedKeyword = seedCard.seedKeyword
        self.seedCreatedDate = Date()
        self.seedNameOrigin = seedCard.seedNameOrigin
        self.seedQuestionList = seedCard.seedQuestionList
        self.seedDiaryTitle = seedCard.seedDiaryTitle
        self.seedDiary = seedCard.seedDiary
        self.seedRetrospectQuestionList = seedCard.seedRetrospectQuestionList
        self.seedRetrospectTitle = seedCard.seedRetrospectTitle
        self.seedRetrospect = seedCard.seedRetrospect
        self.seedIsEvolved = seedCard.seedIsEvolved
    }
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat  = "YYYY. MM. dd"
        return formatter
     }()

    static let dayDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat  = "d"
        return formatter
     }()
    
    
}

extension SeedCard {
    
    
    static var sampleSeedCard1: SeedCard =  {
        var sampleSeedCard = SeedCard(seedFaceIndex: 11, seedShapeIndex: 1, seedColorIndex: 5, seedName: "물방울", seedKeyword: ["오늘은", "기분이", "퐁당"])
    
        sampleSeedCard.seedQuestionList = ["어떤 점이 변하면 이 문제가 해결되었다고 할 수 있을까?", "이 문제가 더 심각해진다면, 어떤게 변할까?", "이 문제를 해결하기 위해 어떤 것들을 시도해볼 수 있을까?"]
        sampleSeedCard.seedDiaryTitle = "오늘의 회고"
        sampleSeedCard.seedDiary = "별과 거선의 반짝이는 뛰노는 가지에 끝에 쓸쓸하랴? 붙잡아 능히 넣는 속잎나고, 생생하며, 꽃이 커다란 것이다. 뼈 인간이 곧 심장은 끓는다. 사는가 일월과 우리는 가치를 있는가? 바로 황금시대의 할지니, 맺어, 커다란 얼마나 능히 품에 얼음과 아니다. 살 꽃이 봄바람을 뼈 있음으로써 피다. 있는 고동을 같이, 사막이다. 고동을 평화스러운 있으며, 위하여, 온갖 사라지지 보이는 듣는다. 옷을 곧 영원히 인생에 인간이 아름답고 천고에 풀이 무엇을 때문이다. 아니더면, 위하여 생명을 놀이 희망의 찾아다녀도, 아름다우냐?"
        
        sampleSeedCard.seedRetrospectQuestionList = []
        sampleSeedCard.seedRetrospectTitle = ""
        sampleSeedCard.seedRetrospect = ""
        sampleSeedCard.seedCreatedDate = dateFormat.date(from: "2022. 04. 06")!
        return sampleSeedCard
    }()
    
    static var sampleSeedCard2: SeedCard =  {
        var sampleSeedCard = SeedCard(seedFaceIndex: 5, seedShapeIndex: 5, seedColorIndex: 0, seedName: "만족", seedKeyword: ["오늘", "기분이", "흐뭇"])
    
        sampleSeedCard.seedQuestionList = ["어떤 점이 변하면 이 문제가 해결되었다고 할 수 있을까?", "이 문제가 더 심각해진다면, 어떤게 변할까?", "이 문제를 해결하기 위해 어떤 것들을 시도해볼 수 있을까?"]
        sampleSeedCard.seedDiaryTitle = "오늘의 회고"
        sampleSeedCard.seedDiary = "별과 거선의 반짝이는 뛰노는 가지에 끝에 쓸쓸하랴? 붙잡아 능히 넣는 속잎나고, 생생하며, 꽃이 커다란 것이다. 뼈 인간이 곧 심장은 끓는다. 사는가 일월과 우리는 가치를 있는가? 바로 황금시대의 할지니, 맺어, 커다란 얼마나 능히 품에 얼음과 아니다. 살 꽃이 봄바람을 뼈 있음으로써 피다. 있는 고동을 같이, 사막이다. 고동을 평화스러운 있으며, 위하여, 온갖 사라지지 보이는 듣는다. 옷을 곧 영원히 인생에 인간이 아름답고 천고에 풀이 무엇을 때문이다. 아니더면, 위하여 생명을 놀이 희망의 찾아다녀도, 아름다우냐?"
        
        sampleSeedCard.seedRetrospectQuestionList = []
        sampleSeedCard.seedRetrospectTitle = ""
        sampleSeedCard.seedRetrospect = ""
        sampleSeedCard.seedCreatedDate = dateFormat.date(from: "2022. 04. 09")!
        sampleSeedCard.seedIsEvolved = true;
        return sampleSeedCard
    }()
    
    static var sampleSeedCard3: SeedCard =  {
        var sampleSeedCard = SeedCard(seedFaceIndex: 4, seedShapeIndex: 6, seedColorIndex: 1, seedName: "화나", seedKeyword: ["오늘", "기분이", "빠직"])
    
        sampleSeedCard.seedQuestionList = ["어떤 점이 변하면 이 문제가 해결되었다고 할 수 있을까?", "이 문제가 더 심각해진다면, 어떤게 변할까?", "이 문제를 해결하기 위해 어떤 것들을 시도해볼 수 있을까?"]
        sampleSeedCard.seedDiaryTitle = "오늘의 회고"
        sampleSeedCard.seedDiary = "별과 거선의 반짝이는 뛰노는 가지에 끝에 쓸쓸하랴? 붙잡아 능히 넣는 속잎나고, 생생하며, 꽃이 커다란 것이다. 뼈 인간이 곧 심장은 끓는다. 사는가 일월과 우리는 가치를 있는가? 바로 황금시대의 할지니, 맺어, 커다란 얼마나 능히 품에 얼음과 아니다. 살 꽃이 봄바람을 뼈 있음으로써 피다. 있는 고동을 같이, 사막이다. 고동을 평화스러운 있으며, 위하여, 온갖 사라지지 보이는 듣는다. 옷을 곧 영원히 인생에 인간이 아름답고 천고에 풀이 무엇을 때문이다. 아니더면, 위하여 생명을 놀이 희망의 찾아다녀도, 아름다우냐?"
        
        sampleSeedCard.seedRetrospectQuestionList = []
        sampleSeedCard.seedRetrospectTitle = ""
        sampleSeedCard.seedRetrospect = ""
        sampleSeedCard.seedCreatedDate = dateFormat.date(from: "2022. 04. 11")!
        return sampleSeedCard
    }()
}
