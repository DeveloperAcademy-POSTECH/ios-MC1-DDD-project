//
//  EvolutionResultView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct EvolutionResultView: View {
    var body: some View {
        
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Text("씨앗카드가 진화해서\n나무카드가 만들어졌어!")
                    .frame(width: 300, height: 50, alignment: .leading)
                    .padding(.top, 70)
                    .font(.system(size:20, weight: .heavy))
                    .foregroundColor(Color.white)

                Image("PurpleTreeCard")
                    .frame(width: 300, height: 480, alignment: .center)
                    .padding(.horizontal, 45.0)
                    .padding(.top, 20.0)
                    .padding(.bottom, 30.0)
                
                
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
                    Button(action: {}) {
                        Image("GoBackHomeButton")
                    }
                }
                .frame(maxWidth: 300)
                .padding(.bottom, 40)
            }
    //        .background(Color(red:40/255, green: 40/255, blue: 40/255))
        }
    }
}

struct EvolutionResultView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionResultView()
    }
}
