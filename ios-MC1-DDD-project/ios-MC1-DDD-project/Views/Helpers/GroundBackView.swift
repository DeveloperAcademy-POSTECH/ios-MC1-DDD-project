//
//  GroundBackView.swift
//  3Diary
//
//  Created by Jaehwa Noh on 2022/04/09.
//

import SwiftUI

struct GroundBackView: View {
    let colorInfo: String
    
    var body: some View {
        GeometryReader {
            geometry in
            
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                
                path.addLines([
                    CGPoint(x: 0, y: width),
                    CGPoint(x: 0, y: 0),
                    CGPoint(x: width, y: 0),
                    CGPoint(x: width, y: width),
                    CGPoint(x: 0, y: width)])
                
            }.fill(.yellow)
        }.aspectRatio(1, contentMode: .fit)
    }
}

struct GroundBackView_Previews: PreviewProvider {
    static var previews: some View {
        GroundBackView(colorInfo: "#FFFFFF")
    }
}
