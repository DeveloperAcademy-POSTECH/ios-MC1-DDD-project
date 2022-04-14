//
//  ContentView.swift
//  ios-MC1-DDD-project
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct ContentView: View {
    @State private var showSeedCreateModal = false
    
    var body: some View {
        Button(action: {showSeedCreateModal = true}) {
            Text("씨앗카드 만들기")
        }
        .sheet(isPresented: self.$showSeedCreateModal) {
//            CreatingSeedView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
