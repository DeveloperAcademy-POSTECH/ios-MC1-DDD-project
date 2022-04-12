//
//  NextView.swift
//  ios-MC1-DDD-project
//
//  Created by kimhyeongmin on 2022/04/11.
//

import SwiftUI

struct NextView: View {
    
    @State private var moving = -100
    
    var body: some View {
        VStack {
            
            Text("A ball falling with bounce")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Spacer()
            
                Image("seed_example")
                    .offset(y: CGFloat(moving))
                    .onAppear(){
                        withAnimation(.spring(response:  0.5, dampingFraction: 0.5, blendDuration: 0).delay(1).repeatForever(autoreverses: false)){
                            moving = 10
                        }
            }
            .scaleEffect(2)
            
            Spacer()
            
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
    }
}
