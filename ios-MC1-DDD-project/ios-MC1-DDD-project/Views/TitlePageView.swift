//
//  TitlePageView.swift
//  3Diary
//
//  Created by Jaehwa Noh on 2022/04/08.
//

import SwiftUI

struct TitlePageView: View {
    
//    @State private var isFront: Bool = true
    static let cardRange: ClosedRange = 0...2
    @State private var isFrontArray = Array(repeating: true, count: cardRange.count)
    
    
    var body: some View {
        
        
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Label("Options", systemImage: "line.3.horizontal")
                        .labelStyle(.iconOnly)
                }
                Spacer()
                //                Text("2022.04.07")
                Spacer()
                Button {
                    
                } label: {
                    Label("Calendar", systemImage: "calendar")
                        .labelStyle(.iconOnly)
                }
            }
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach (TitlePageView.cardRange, id: \.self) { i in
                        
                        
                        Button() {
                            withAnimation {
                                isFrontArray[i].toggle()
                                print("hello \(isFrontArray), \(i)")
                            }
                        } label: {
                            ZStack {
                                CharacterCardView().frame(width: 300, height: 300, alignment: .center)
                                    .rotation3DEffect(.degrees(isFrontArray[i] ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                                    .opacity(isFrontArray[i] ? 1.0 : 0.0)
                                
                                
                                CharacterCardBackView()
                                    .frame(width: 300,
                                           height: 300,
                                           alignment: .center)
                                    .rotation3DEffect(.degrees(isFrontArray[i] ? -180 : 0), axis: (x: 0, y: 1, z: 0))
                                    .opacity(isFrontArray[i] ? 0.0 : 1.0)
                                
                            }
                            
                        }
                        //                        CharacterCardView().frame(width: 300, height: 300, alignment: .center)
                    }.padding(10)
                }
            }
            
            Spacer().frame(height: 50)
            HStack {
                Spacer()
                Button("New Seed") {
                    
                }
                Spacer()
                Button("Edit") {
                    
                }
                Spacer()
                
            }
            Spacer()
            
        }.padding([.trailing, .leading], 20)
        
        
        
    }
    
}



struct TitlePageView_Previews: PreviewProvider {
    static var previews: some View {
        TitlePageView()
    }
}
