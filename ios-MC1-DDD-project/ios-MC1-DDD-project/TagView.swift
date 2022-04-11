//
//  TagView.swift
//  Arcon_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct TagView: View {
    
    @State var name: String = ""
    @State var tagTests: [String]
    
    
    var body: some View {
        VStack {
            HStack{
                TextField("키워드입력", text: $name)
                    .frame(width: 100)
                Button("Add") {
                    if name != "" {
                        tagTests.append(name)
                        name = ""
                    }
                }
                Spacer()
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(tagTests, id:\.self) {
                            tag in
                            Button("#\(tag)  "){
                                print("버튼액션\(tag)")
                                let index = tagTests.firstIndex(of: tag)
                                tagTests.remove(at: Int(index!) )
                            }.foregroundColor(.black)
                        }
                    }
                }
                
            }.padding()
                .frame(width: 360)
        }
        .overlay(
            RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                .foregroundColor(Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255))
            )
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tagTests:[])
    }
}
