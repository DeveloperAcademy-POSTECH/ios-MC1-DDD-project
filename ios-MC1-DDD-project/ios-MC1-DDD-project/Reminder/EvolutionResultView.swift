//
//  EvolutionResultView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct EvolutionResultView: View {
    @State var seedCard: SeedCard
    @State var goBackHome: Bool = false
    @State var isFront: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Text("나무카드로 진화했어!\n카드를 터치해서 뒤집어봐")
                    .frame(width: 300, height: 50, alignment: .leading)
                    .padding(.top, 70)
                    .font(.system(size:20, weight: .heavy))
                    .foregroundColor(Color.white)

//                SeedCardView(seedCard: seedCard)
                
                
                ZStack {
                    Button() {
                        withAnimation {
                            isFront.toggle()
                        }
                    } label: {
                        ZStack {
                            SeedCardBackView(seedCard: seedCard)
                                .rotation3DEffect(.degrees(isFront ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                                .opacity(isFront ? 1.0 : 0.0)
                            
                            SeedCardView(seedCard: seedCard)
                                .rotation3DEffect(.degrees(isFront ? -180 : 0), axis: (x: 0, y: 1, z: 0))
                                .opacity(isFront ? 0.0 : 1.0)
                        }
                    }
                    .frame(width: 300, height: 500, alignment: .center)
                    .padding(30)
                }
                
                HStack {
//                    Button(action: {}) {
//                        Text("응 만들래")
//                            .font(.system(size: 20, weight: .heavy))
//
//                    }
//                    .frame(width: 145, height: 48, alignment: .center)
//                    .background(Color(red:160/255, green: 194/255, blue: 160/255))
//                    .foregroundColor(.white)
//                    .cornerRadius(25)
//                    .font(.title3)
//                    .padding(.horizontal, 5.0)
//                    .padding(.bottom, 40)
                    
                    Button {
//                        presentationMode.wrappedValue.dismiss()
                        goBackHome = true
                    } label: {
                        Text("홈으로 돌아가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(width: 256, height: 48)
                    }
                    .frame(width: 320, height: 48)
                    .foregroundColor(.white)
                    .background(Color(seedCard.seedColor))
                    .cornerRadius(40)
                    .fullScreenCover(isPresented: $goBackHome) {
                        MainPageView()
                    
                }
                .frame(maxWidth: 320)
                .padding(.bottom, 40)
            }
            }
    //        .background(Color(red:40/255, green: 40/255, blue: 40/255))
        }
    }
}

struct EvolutionResultView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionResultView(seedCard: .sampleSeedCard1)
    }
}
