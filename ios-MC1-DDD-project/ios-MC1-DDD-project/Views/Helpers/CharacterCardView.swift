
//  CharacterCardView.swift
//  3Diary
//
//  Created by Jaehwa Noh on 2022/04/09.


import SwiftUI

var shape = RoundedRectangle(cornerRadius: 16)

struct CharacterCardView: View {
    
    var isFront = true
    
    func get() -> Bool {
        return isFront
    }
    
    mutating func toggleFront() {
        isFront.toggle()
    }
    
    var body: some View {
        ZStack {
            GroundView(colorInfo: "#FFFFFF")
            CircleImageView(image: Image("character"))
            VStack{
                HStack {
                    Text("메롱 열매")
                    Spacer()
                }.padding([.bottom], 1)
                
                HStack {
                    ForEach(1..<4) { _ in
                        Text("#홍대")
                    }
                    Spacer()
                }
            }
            
            .offset(x: 15, y:100)
            Text("2022.04.07").offset(x:0, y: -130)
        }
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 2)
            .foregroundColor(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)))
        
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardView()
    }
}
