//
//  ContentView.swift
//  ios-MC1-DDD-project
//
//  Created by 이성노 on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    @State var seedname: String = ""
    @State var remind = true
    
    var body: some View {
        NavigationView
        {
        ZStack {
            Color(red: 243 / 255, green: 242 / 255, blue: 240 / 255).ignoresSafeArea()

            VStack(alignment: .center, spacing: 20)
                {
                    Text("이 씨앗의 이름을 붙여줄래?")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    Image("seed_example")
                        .resizable().frame(width: 200, height: 200, alignment: .center)
                        
                    HStack {
                        ZStack {
                            
                            if seedname.isEmpty {
                                Text("이름")
                                    .font(.system(size: 30))
                                    .bold()
                                    .foregroundColor(Color("darkcolor"))
                                }
                            
                            TextField("", text: $seedname)
                                .frame(width: 100, height: 50, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("darkcolor").opacity(0.5)))
                        }
                        
                        Text("씨앗")
                            .font(.system(size: 30))
                            .foregroundColor(Color("darkcolor"))
                            .bold()
                            
                    }
                    
                    HStack(alignment: .top, spacing: 100.0)
                    {
                        Toggle(isOn: $remind)
                        {
                            Text("나중에 너의 씨앗을 다시 살펴볼까?")
                                .foregroundColor(Color("darkcolor"))
                                .bold()
                        }
                    }.padding(29.0)
                    NavigationLink(destination: PlantingSeedView().navigationBarBackButtonHidden(true))                        {
                        Image("button_image")
                        }
                    }
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
