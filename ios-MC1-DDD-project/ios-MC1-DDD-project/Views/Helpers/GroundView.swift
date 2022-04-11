//
//  GroundView.swift
//  3Diary
//
//  Created by Jaehwa Noh on 2022/04/09.
//

import SwiftUI

struct GroundView: View {
    
    let colorInfo: String
    
    var body: some View {
        GeometryReader {
            geometry in
            
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.5
                
                path.addLines([
                    CGPoint(x: 0, y: width),
                    CGPoint(x: 0, y: height),
                    CGPoint(x: width, y: height),
                    CGPoint(x: width, y: width),
                    CGPoint(x: 0, y: width)])
                
            }.fill(.yellow)
        }.aspectRatio(1, contentMode: .fit)
    }
    
    
}

struct GroundView_Previews: PreviewProvider {
    static var previews: some View {
        GroundView(colorInfo: "#FFFFFF")
    }
}
