//
//  ContentView.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/10.
//

import SwiftUI

struct MainPageView: View {
    var today = Date()
    let buttonSize: CGFloat = 28

    @State private var choiceDate = Date()
    @State private var isActivated = false

    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat  = "YYYY. MM. dd"
        return formatter
     }()

    static let dayDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat  = "d"
        return formatter
     }()
    
    var body: some View {
        NavigationView {
            VStack {
                //Mark: - 메뉴, 날짜, 달력 상단 구현
                CustomNavBar(left: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.buttonSize, height: self.buttonSize, alignment: .leading)
                        .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                        .padding(.leading, 40)
                }, center: {
                    
                    Text(today, formatter: MainPageView.dateFormat)
                        .font(.system(size: 25, weight: .light))
                        .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                    
                }, right: {
                    Image(systemName: "calendar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.buttonSize, height: self.buttonSize, alignment: .trailing)
                        .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                        .padding(.trailing, 40)
                })
                .padding(.top, 20)
                
                Spacer()
                
                HStack {
                    ForEach(0..<4) { i in
                        if (i % 4 == 3) {
                            FirstMainCard()
                        } else if (i % 4 == 2) {
                            SecondMainCard()
                        } else if (i % 4 == 1) {
                            ThridMainCard()
                        } else {
                            ForthMainCard()
                        }
                    }
                }.modifier(ScrollingHStackModifier(items: 4, itemWidth: 300, itemSpacing: 10))

                
                Spacer()

                HStack {
                    NavigationLink(destination: DetailFirstPageView()) {
                        Image("newSeedFeed")
                    }
                    .padding(.trailing, 10)
                    
                    Button {
                        print("캘린더바를 클릭했습니다.")
                    } label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: self.buttonSize, height: self.buttonSize, alignment: .trailing)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 40)
                    
                    Button {
                        print("캘린더바를 클릭했습니다.")
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: self.buttonSize, height: self.buttonSize, alignment: .trailing)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 10)
                }
                .padding(.bottom, 40)
                Spacer()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
