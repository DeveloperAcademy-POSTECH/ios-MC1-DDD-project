//
//  TestView.swift
//  ios-MC1-DDD-project
//
//  Created by kimhyeongmin on 2022/04/12.
//

import SwiftUI

struct TestView: View {
        
        Image("seed_example")
            .renderingMode(.template)
            .foregroundColor(Color9)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
