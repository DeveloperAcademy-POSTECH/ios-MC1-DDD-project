//
//  CharacterCardBackView.swift
//  3Diary
//
//  Created by Jaehwa Noh on 2022/04/09.
//

import SwiftUI

struct CharacterCardBackView: View {
    
    var body: some View {
        ZStack {
            
            GroundBackView(colorInfo: "#FFFFFF")
            ScrollView{
                Text("엄청나게 긴 글자들 \nㄴ이럼인러ㅣ;ㅁㅇㄴ러ㅣㅇ너리ㅓㅁㅇㄴ럼언렁ㅁㄴ러밍너리;ㅓㅇ닐;ㅓㅣ;ㅁㅇ너리;ㅓㅁㅇ니럼인러ㅣㅁㅇ너리;ㅓㅁㅇ니;러인;러ㅣㅁㅇ너림ㅇ너링ㅁ너리ㅓㅇ니;렁;ㅣㄴ러ㅣㅇㅁ너리;ㅁㄴ어리;ㅓㅇㄴ미;럼인;러인ㅁ;ㅣ얼밍ㄴ럼;ㅇ니러미;ㅇ너리;ㅁ언리;ㅁ언리;ㅓㅁㅇ니;럼ㅇ니;럼인러밍널미;ㅇ너리;ㅁ언ㄹ;ㅣㅁ어니;ㄹㅁ어니;럼ㅇ니;ㄹ;ㅁ언\n\n\n\n\nasdfjkladsjfl;djsaf;ldsajf\n")
            }.frame(width: 250, height: 240, alignment: .center)
            
        }.cornerRadius(15)
        .overlay(
        RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 2)
            .foregroundColor(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255))
        )
    }
}

struct CharacterCardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardBackView()
    }
}
