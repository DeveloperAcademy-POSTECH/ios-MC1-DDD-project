//
//  CircleImageView.swift
//  3Diary
//
//  Created by Jaehwa Noh on 2022/04/09.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    
    var body: some View {
        image
            .padding(20)
            .background(Color.white)
            .clipShape(Circle())
            
        
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("character"))
    }
}
