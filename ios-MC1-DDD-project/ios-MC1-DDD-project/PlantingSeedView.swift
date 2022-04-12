//
//  PlantingSeedView.swift
//  ios-MC1-DDD-project
//
//  Created by kimhyeongmin on 2022/04/10.
//

import SwiftUI

struct PlantingSeedView: View {
    
    @State var viewTranseform = false
    @State private var moving = -100
    
    @State var firstIsTappedNumber: Int = 6
    @State var secondIsTappedNumber: Int = 6
    @State var currentSeedColor: Int = 6
    
    @State var firstIsSelected = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Blur()
                            .padding(.bottom, 500)
                    }
                }
                NavigationLink(isActive: $viewTranseform) {
                    NextView().navigationBarBackButtonHidden(true)
                } label: {}
                
                VStack {
                    Spacer()
                    
                    ZStack{
                        Image("ShapePNG\(ChooseSecondDetailInformation(secondIsTappedNumber: $secondIsTappedNumber).secondIsTappedNumber)")
                            .renderingMode(.template)
                            .foregroundColor(Color("Color\(currentSeedColor)"))
                            .scaleEffect(1.8)
                        
                        Image("ImojiPNG\(ChooseFirstDetailInformation(firstIsTappedNumber: $firstIsTappedNumber, firstIsSelected: $firstIsSelected).firstIsTappedNumber)")
                            .renderingMode(.template)
                            .foregroundColor(secondIsTappedNumber == 9 ? Color.white : Color("darkcolor"))
                            
                    }
                    .offset(y: CGFloat(moving))
                    .onAppear(){
                        withAnimation(.spring(response:1, dampingFraction:0.8, blendDuration:0).delay(0.5)){
                            moving = 220
                        }
                    }
                    .scaleEffect(1)
                    
                    Spacer()
                    
                    Image("GroundForSowing")
                        .renderingMode(.template)
                        .foregroundColor(Color("Color\(currentSeedColor)"))
                }
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.viewTranseform = true
            }
        })
    }
    
    struct Blur: View {
        let characters = Array("너의 씨앗은 멋진 나무가 될거야")
        @State var blurValue: Double = 10
        @State var opacity: Double = 0
        
        var body: some View {
            
            VStack {
                HStack(spacing: 1){
                    ForEach(0..<17) { num in
                        Text(String(self.characters[num]))
                            .font(.system(size: 25))
                            .foregroundColor(Color.white)
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
                        }
                        else {
                            blurValue = 0
                            opacity = 1
                        }
                    }
                    
                }
                
                Text("")
                
                Text("2022.04.12")
                    .font(.system(size: 20))
                    .foregroundColor(Color("Color9"))
                    .bold()
                    .blur(radius: blurValue)
                    .opacity(opacity)
                    .animation(.easeInOut.delay(1),
                               value: blurValue)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {}
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

