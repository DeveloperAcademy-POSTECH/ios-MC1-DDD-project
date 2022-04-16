//
//  HeadCardDoneView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct BackCardCompleteView: View {
    let seedCardManager = SeedCardManager.seedCardManager
    @State private var isFront: Bool = false
    
    @State var seedCard: SeedCard
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                ZStack{
                    VStack(alignment: .center) {
                        HStack {
//                            Text("씨앗 카드를 완성했어! \n카드를 터치해서 뒤집어봐")
                            Text("You made a seed card\nTouch the card to see your story")
                                .frame(width: 300, height: 50, alignment: .leading)
                                .padding(.top, 70)
                                .font(.system(size:20, weight: .regular))
                                .foregroundColor(Color.white)
                                .offset(x: 0, y: 10)
                        }
                        .frame(width: 300)
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
                            NavigationLink {
                                PlantingSeedView(seedCard: seedCard)
                                    .navigationBarTitle("", displayMode: .inline)
                                    .navigationBarHidden(true)
                                    .onAppear {
                                        seedCardManager.appendCard(seedCard: seedCard)
                                    }
                            } label: {
                                Text("Plant Your Seed")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .frame(width: 300, height: 48)
                            }
                            .frame(width: 320, height: 48)
                            .foregroundColor(Color.white)
                            .background(Color(seedCard.seedColor))
                            .cornerRadius(40)
                        }
                        .frame(maxWidth: 300)
                        .padding(.bottom, 40)
                    }
                    
                    
                }
                //        .background(Color(red:40/255, green: 40/255, blue: 40/255))
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct BackCardCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardCompleteView(seedCard: SeedCard.sampleSeedCard1)
    }
}
