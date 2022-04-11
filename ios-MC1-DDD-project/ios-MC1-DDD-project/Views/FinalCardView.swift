//
//  FinalCardView.swift
//  3Diary
//
//  Created by Jaehwa Noh on 2022/04/11.
//

import SwiftUI

struct FinalCardView: View {
    
    @State private var isFront = true
    
    var body: some View {
        VStack {
            Spacer()
            Text("짜잔. 완성이다.")
            
            Button() {
                withAnimation() {
                    isFront.toggle()
                }
                
            } label: {
                ZStack {
                    CharacterCardView().frame(width: 300, height: 300, alignment: .center)
                        .rotation3DEffect(.degrees(isFront ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                        .opacity(isFront ? 1.0 : 0.0)
                    
                    
                    CharacterCardBackView()
                        .frame(width: 300,
                               height: 300,
                               alignment: .center)
                        .rotation3DEffect(.degrees(isFront ? -180 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(isFront ? 0.0 : 1.0)
                }
            }
            
            
            Spacer().frame(height: 40)
            Button("완료") {
                
            }
            Spacer()
        }
    }
}


struct FinalCardView_Previews: PreviewProvider {
    static var previews: some View {
        FinalCardView()
    }
}
