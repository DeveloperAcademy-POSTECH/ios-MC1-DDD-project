//
//  CardEvolutionView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct CardEvolutionView: View {
    @State var seedCard: SeedCard
    @State var notRetroSpectingCard: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Text("카드를 만든 날을 돌아보면\n씨앗이 진화할거야")
                        .frame(width: 300, height: 50, alignment: .leading)
                        .padding(.top, 70)
                        .font(.system(size:20, weight: .heavy))
                        .foregroundColor(Color.white)
                    
                    SeedCardView(seedCard: seedCard)
                        .padding(30)
                    
                    
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
                        
                        NavigationLink(destination: RetrospectMakingView(seedCard: seedCard)
                            .navigationBarHidden(true)
                            .navigationBarTitle("", displayMode:.inline)
                        ) {
                            Image("EvolutionButton")
                        }
                        
                        Spacer()
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("doItLaterButton")
                        }
                    }
                    .fullScreenCover(isPresented: $notRetroSpectingCard) {
                        MainPageView()
                            .navigationBarHidden(true)
                            .navigationBarTitle("", displayMode:.inline)
                    }
                    
                }
                .frame(maxWidth: 300)
                .padding(.bottom, 40)
            }
            //        .background(Color(red:40/255, green: 40/255, blue: 40/255))
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode:.inline)
        }
    }
}

struct CardEvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        CardEvolutionView(seedCard: SeedCard.sampleSeedCard1)
    }
}
