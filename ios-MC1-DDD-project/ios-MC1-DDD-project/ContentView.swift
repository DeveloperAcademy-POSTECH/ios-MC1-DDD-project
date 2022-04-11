//
//  ContentView.swift
//  ios-MC1-DDD-project
//
//  Created by 이성노 on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                DiaryView()
            }label:{
                Text("Hello, world!")
                    .padding()
            }
            .navigationBarTitle("",displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
