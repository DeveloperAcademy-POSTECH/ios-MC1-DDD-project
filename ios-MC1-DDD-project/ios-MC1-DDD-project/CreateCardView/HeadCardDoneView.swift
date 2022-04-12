//
//  HeadCardDoneView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct HeadCardDoneView: View {
    
    var body: some View {
        
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Text("씨앗 카드 앞면을 만들었어\n뒷면도 만들어볼래?")
                    .frame(width: 300, height: 50, alignment: .leading)
                    .padding(.top, 70)
                    .font(.system(size:20, weight: .heavy))
                    .foregroundColor(Color.white)

                Image("greenSeedCard")
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
                        Image("YesCreateButton")
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image("NoCreateButton")

                    }
                }
                .frame(maxWidth: 300)
                .padding(.bottom, 40)
            }
    //        .background(Color(red:40/255, green: 40/255, blue: 40/255))
        }
    }
}

struct HeadCardDoneView_Previews: PreviewProvider {
    static var previews: some View {
        HeadCardDoneView()
    }
}
