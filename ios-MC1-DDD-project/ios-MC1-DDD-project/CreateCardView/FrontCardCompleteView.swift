//
//  HeadCardDoneView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct FrontCardCompleteView: View {
    let seedCardManager = SeedCardManager.seedCardManager
    
    @State var seedCard: SeedCard
    @State private var notCreatingCard: Bool = false
    @State private var backCardMakeBtn: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
//                    Text("씨앗 카드 앞면을 만들었어\n뒷면도 만들어볼래?")
                    Text("You made front side\nPress Continue to complete")
//                    Text("Front of the card is done\nComplete the back, too?")
                        .frame(width: 300, height: 50, alignment: .leading)
                        .padding(.top, 70)
                        .font(.system(size:20, weight: .regular))
                        .foregroundColor(Color.white)
                        .offset(x: 0, y: 10)
                    SeedCardView(seedCard: seedCard)
                        .padding(35)
                    
                    
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
                        
                        //                    Button(action: {
                        //
                        //                    }) {
                        //                        Image("YesCreateButton")
                        //
                        //                    }
                        
                        Button {
                            seedCardManager.appendCard(seedCard: seedCard)
                            notCreatingCard = true;
                        } label: {
//                            Text("아니 괜찮아")
                            Text("It's Okay")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(width: 145, height: 48)
                        }
                        .frame(width: 150, height: 48)
                        .foregroundColor(.white)
                        .background(Color("Color1"))
                        .cornerRadius(40)
                        .fullScreenCover(isPresented: $notCreatingCard) {
                            MainPageView()
                            
                        }
                        
                        Spacer()
                        
                        Button {
                            backCardMakeBtn = true
                        } label: {
//                            Text("응 만들래")
                            Text("Continue")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(width: 145, height: 48)
                            
                            NavigationLink(isActive: $backCardMakeBtn) {
                                BackCardMakingView(seedCard: seedCard)
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true)
                            } label: {}
                        }
                        .frame(width: 150, height: 48)
                        .foregroundColor(.white)
                        .background(Color("Color4"))
                        .cornerRadius(40)
                        
                    }
                    .frame(maxWidth: 320)
                    .padding(.bottom, 40)
                }
                //        .background(Color(red:40/255, green: 40/255, blue: 40/255))
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct FrontCardCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        FrontCardCompleteView(seedCard: SeedCard.sampleSeedCard1)
    }
}
