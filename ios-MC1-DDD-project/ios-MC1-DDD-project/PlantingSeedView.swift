//
//  PlantingSeedView.swift
//  ios-MC1-DDD-project
//
//  Created by kimhyeongmin on 2022/04/10.
//

import SwiftUI

struct PlantingSeedView: View {
    @State var sayHello = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Image("PlantingSeed")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Blur()
                            .padding(.bottom, 500)
                    }
                }
                NavigationLink(isActive: $sayHello) {
                    NextView()
                } label: {}
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.sayHello = true
            }
        })
    }

struct Blur: View {
    let characters = Array("너의 씨앗은 멋진 나무가 될거야")
    @State var blurValue: Double = 10
    @State var opacity: Double = 0
    
    var body: some View {
        
        HStack(spacing: 1){
            ForEach(0..<17) { num in
                Text(String(self.characters[num]))
                    .font(.system(size: 25))
                    .bold()
                    .blur(radius: blurValue)
                    .opacity(opacity)
                    .animation(.easeInOut.delay( Double(num) * 0.05 ),
                                value: blurValue)
            }
        }.onTapGesture {
            if blurValue == 0 {
                blurValue = 10
                opacity = 0.01
            } else {
                blurValue = 0
                opacity = 1
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if blurValue == 0{
                    blurValue = 10
                    opacity = 0.01
                } else {
                    blurValue = 0
                    opacity = 1
                }
            }
            // Reference from :
            // https://github.com/chitomo12/SwiftUI-Text-Animation-Library?ref=iosexample.com#blur
        }
    }
}


struct PlantingSeedView_Preview: PreviewProvider {
    static var previews: some View {
        PlantingSeedView()
    }
}
}
