//
//  SeedCardView.swift
//  ios-MC1-DDD-project
//
//  Created by Park Sungmin on 2022/04/12.
//


// 카드뷰 예시로 넣고싶다면 아래처럼 활용하세요
// SeedCardView(seedCard: SeedCard(seedFaceIndex: 4, seedShapeIndex: 7, seedColorIndex: 4, seedName: "카드 너무 이뻐요", seedKeyword: ["안녕", "만나서", "반가워"]))

// 카드뷰 활용할 때는 아래처럼 활용하세요
// SeedCardView(seedCard: seedCard 오브젝트)


import SwiftUI

struct SeedCardView: View {
    let seedCard: SeedCard
    
    init(seedCard: SeedCard) {
        self.seedCard = seedCard
    }
    
    var body: some View {
        ZStack {
            // 배경 카드 구성
            Rectangle()
                .foregroundColor(Color(seedCard.seedColor))
            
            VStack{
                Image("SeedCardBackImage")
                    .renderingMode(.template)
                    .foregroundColor(Color.white)
                
            }
            .frame(width:320, height: 500, alignment: .top)
            .scaleEffect(1.2)
            .offset(y:10)
            
//            Rectangle()
//                .frame(width: 320, height: 230, alignment: .center)
//                .foregroundColor(Color.white)
//            Spacer()
            
            // 씨앗 캐릭터 생성 + 배치
            ZStack{
                Image(seedCard.seedShape)
                    .renderingMode(.template)
                    .foregroundColor(Color(seedCard.seedColor))
                    .scaleEffect(1.8)
//                            .offset(x: 0, y: -260)
                
                Image(seedCard.seedFace)
                    .renderingMode(.template)
                    .foregroundColor(Color("darkcolor"))
                    .offset(x: 0, y: 3)
                    
            }
            .frame(width: 100, height: 100, alignment: .center)
            .offset(y:-25)
            
            // 씨앗 이름, 태그 배치
            VStack {
                Spacer()
                Text(seedCard.seedName)
                    .frame(width: 250, alignment: .leading)
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(.white)
                    .padding(.vertical, 1)
                    
                HStack {
                    ForEach(0 ..< seedCard.seedKeyword.count) { keyword in
                        Text("#\(seedCard.seedKeyword[keyword])")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 250, alignment: .leading)
            }
            .frame(width: 250, height: 410)
            
            // 씨앗 생성 날짜 배치
            VStack {
                Text("Apr")
                    .frame(width: 250, alignment: .leading)
                    .font(.system(size: 28, weight: .thin))
                    .foregroundColor(Color(seedCard.seedColor))
                Text(seedCard.seedCreatedDate, formatter: SeedCard.dayDateFormat)
                    .frame(width: 250, alignment: .leading)
                    .font(.system(size: 40, weight: .light))
                    .foregroundColor(Color(seedCard.seedColor))
                Spacer()
            }
            .frame(width: 250, height: 430)
        }
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color(seedCard.seedColor), lineWidth: 2))
        .frame(width: 320, height: 500)

    }
}

struct SeedCardView_Previews: PreviewProvider {
    static var previews: some View {
        SeedCardView(seedCard: SeedCard.sampleSeedCard1)
            .previewLayout(.fixed(width: 320, height: 500))
    }
}
