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
                return "\(self.seedNameOrigin) Tree"
            }
            else {
                return "\(self.seedNameOrigin) Seed"
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
        var sampleSeedCard = SeedCard(seedFaceIndex: 11, seedShapeIndex: 1, seedColorIndex: 5, seedName: "Waterdrop", seedKeyword: ["feel", "so", "plop"])
    
        sampleSeedCard.seedQuestionList = ["어떤 점이 변하면 이 문제가 해결되었다고 할 수 있을까?", "이 문제가 더 심각해진다면, 어떤게 변할까?", "이 문제를 해결하기 위해 어떤 것들을 시도해볼 수 있을까?"]
        sampleSeedCard.seedDiaryTitle = "Happy Birthday"
        sampleSeedCard.seedDiary = "Fruitcake bear claw sesame snaps cotton candy jujubes cookie tiramisu brownie cake. Gummies oat cake oat cake marzipan soufflé. Apple pie powder marzipan jelly-o biscuit sesame snaps lollipop. Pudding oat cake oat cake chocolate bar muffin carrot cake cheesecake cupcake. Powder fruitcake gummi bears sesame snaps shortbread. Apple pie candy cake cake macaroon muffin cake cookie. Halvah jelly-o chocolate cake apple pie dragée. Marzipan icing marzipan pudding toffee ice cream candy canes. "
        
        sampleSeedCard.seedRetrospectQuestionList = []
        sampleSeedCard.seedRetrospectTitle = ""
        sampleSeedCard.seedRetrospect = ""
        sampleSeedCard.seedCreatedDate = dateFormat.date(from: "2022. 04. 06")!
        return sampleSeedCard
    }()
    
    static var sampleSeedCard2: SeedCard =  {
        var sampleSeedCard = SeedCard(seedFaceIndex: 5, seedShapeIndex: 5, seedColorIndex: 0, seedName: "Fullfill", seedKeyword: ["Apple", "Academy"])
    
        sampleSeedCard.seedQuestionList = ["어떤 점이 변하면 이 문제가 해결되었다고 할 수 있을까?", "이 문제가 더 심각해진다면, 어떤게 변할까?", "이 문제를 해결하기 위해 어떤 것들을 시도해볼 수 있을까?"]
        sampleSeedCard.seedDiaryTitle = "So Annoying Day"
        sampleSeedCard.seedDiary = "Fruitcake bear claw sesame snaps cotton candy jujubes cookie tiramisu brownie cake. Gummies oat cake oat cake marzipan soufflé. Apple pie powder marzipan jelly-o biscuit sesame snaps lollipop. Pudding oat cake oat cake chocolate bar muffin carrot cake cheesecake cupcake. Powder fruitcake gummi bears sesame snaps shortbread. Apple pie candy cake cake macaroon muffin cake cookie. Halvah jelly-o chocolate cake apple pie dragée. Marzipan icing marzipan pudding toffee ice cream candy canes. "
        
        sampleSeedCard.seedRetrospectTitle = "I Feel Good!"
        sampleSeedCard.seedRetrospect = "Fruitcake bear claw sesame snaps cotton candy jujubes cookie tiramisu brownie cake. Gummies oat cake oat cake marzipan soufflé. Apple pie powder marzipan jelly-o biscuit sesame snaps lollipop. Pudding oat cake oat cake chocolate bar muffin carrot cake cheesecake cupcake. Powder fruitcake gummi bears sesame snaps shortbread. Apple pie candy cake cake macaroon muffin cake cookie. Halvah jelly-o chocolate cake apple pie dragée. Marzipan icing marzipan pudding toffee ice cream candy canes. "
        
        sampleSeedCard.seedRetrospectQuestionList = ["Fruitcake bear claw sesame snaps cotton candy jujubes cookie tiramisu brownie cake. Gummies oat cake", "Fruitcake bear claw sesame snaps cotton candy jujubes."]
        sampleSeedCard.seedCreatedDate = dateFormat.date(from: "2022. 04. 09")!
        sampleSeedCard.seedIsEvolved = true;
        return sampleSeedCard
    }()
    
    static var sampleSeedCard3: SeedCard =  {
        var sampleSeedCard = SeedCard(seedFaceIndex: 4, seedShapeIndex: 6, seedColorIndex: 1, seedName: "Annoyed", seedKeyword: ["Coffee", "Clothes"])
    
        sampleSeedCard.seedQuestionList = ["어떤 점이 변하면 이 문제가 해결되었다고 할 수 있을까?", "이 문제가 더 심각해진다면, 어떤게 변할까?", "이 문제를 해결하기 위해 어떤 것들을 시도해볼 수 있을까?"]
        sampleSeedCard.seedDiaryTitle = "So Annoying Day"
        sampleSeedCard.seedDiary = "Fruitcake bear claw sesame snaps cotton candy jujubes cookie tiramisu brownie cake. Gummies oat cake oat cake marzipan soufflé. Apple pie powder marzipan jelly-o biscuit sesame snaps lollipop. Pudding oat cake oat cake chocolate bar muffin carrot cake cheesecake cupcake. Powder fruitcake gummi bears sesame snaps shortbread. Apple pie candy cake cake macaroon muffin cake cookie. Halvah jelly-o chocolate cake apple pie dragée. Marzipan icing marzipan pudding toffee ice cream candy canes. "
        
        sampleSeedCard.seedRetrospectQuestionList = []
        sampleSeedCard.seedRetrospectTitle = ""
        sampleSeedCard.seedRetrospect = ""
        sampleSeedCard.seedCreatedDate = dateFormat.date(from: "2022. 04. 11")!
        return sampleSeedCard
    }()
}
