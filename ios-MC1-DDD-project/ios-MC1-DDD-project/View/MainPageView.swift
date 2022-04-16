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
    let seedCardManager = SeedCardManager.seedCardManager
    
    @State var isEvolutionClicked = false
    
    @State private var choiceDate = Date()
    @State private var isActivated = false
    @State var currentPageIndex: CGFloat = 0
    @State var showSeedCreateModal: Bool = false
    @State private var isFront: [Bool] = [Bool](repeating: false, count: 100)
    
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
    
    init() {
        currentPageIndex = CGFloat(seedCardManager.seedCardList.count-1)
    }
    
    func addNotification() {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "\(SeedCard.sampleSeedCard1.seedName) says to you"
            content.subtitle = "\"Do you still think so?\""
            content.sound = UNNotificationSound.default
            
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings {settings in
            if settings.authorizationStatus == .authorized {
                // 권한 요청
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) {
                    success, error in
                    if success {
                        // 권한 요청
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    addNotification()
                } label: {
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: self.buttonSize, alignment: .trailing)
                        .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                        .opacity(0.1)
                }
                .frame(height: 80)
                //Mark: - 메뉴, 날짜, 달력 상단 구현
                CustomNavBar( left: {
                    //                    Image(systemName: "line.3.horizontal")
                    //                        .resizable()
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(width: self.buttonSize, height: self.buttonSize, alignment: .leading)
                    //                        .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                    //                        .padding(.leading, 40)
                }
                              ,
                              center: {
                    
                    Text(today, formatter: MainPageView.dateFormat)
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(Color.init(red: 102/255, green: 102/255, blue: 102/255))
                    
                }, right: {
                                            
                })
                .padding(.top, 20)
                
                Spacer()
                
                HStack {
                    ForEach(0..<seedCardManager.seedCardList.count) { i in
                        ZStack {
                            
                            ZStack {
                                SeedCardBackView(seedCard: seedCardManager.seedCardList[i])
                                    .rotation3DEffect(.degrees(isFront[i] ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                                    .opacity(isFront[i] ? 1.0 : 0.0)
                                
                                SeedCardView(seedCard: seedCardManager.seedCardList[i])
                                    .rotation3DEffect(.degrees(isFront[i] ? -180 : 0), axis: (x: 0, y: 1, z: 0))
                                    .opacity(isFront[i] ? 0.0 : 1.0)
                            }
                            .frame(width: 300, height: 500, alignment: .center)
                            .padding(10)
                            .onTapGesture {
                                withAnimation {
                                    isFront[i].toggle()
                                }
                            }
                        }
                        //                        SeedCardView(seedCard: seedCardManager.seedCardList[i])
                        .scaleEffect(Int(currentPageIndex) == seedCardManager.seedCardList.count-i-1 ? 1 : 0.93)
                        
                    }
                }
                //                .environment(\.layoutDirection, .rightToLeft)
                .modifier(ScrollingHStackModifier_R(items: seedCardManager.seedCardList.count, itemWidth: 320, itemSpacing: 10, currentPageIndex: $currentPageIndex))
                
                
                Spacer()
                
                HStack {
                    
                    Button {
                        showSeedCreateModal = true
                    } label: {
                        Label("New Seed", systemImage: "plus")
                        //                        Text("진화하기")
                            .font(.system(size: 19, weight: .bold))
                            .frame(width: 145, height: 48)
                    }
                    .frame(width: 150, height: 48)
                    .foregroundColor(.white)
                    .background(Color("Color"))
                    .cornerRadius(40)
                    .fullScreenCover(isPresented: self.$showSeedCreateModal) {
                        DetailFirstPageView()
                        
                    }
                    .padding(.trailing, 10)
                    
                    Spacer()
                    
                    Button {
                        isEvolutionClicked = true
                    } label: {
                        Label("Grow", systemImage: "arrow.up")
                        //                        Text("진화하기")
                            .font(.system(size: 19, weight: .bold))
                            .frame(width: 145, height: 48)
                    }
                    .frame(width: 150, height: 48)
                    .foregroundColor(.white)
                    .background(Color("Color"))
//                    .background(seedCardManager.evolutionComplete(index: Int(currentPageIndex)) ? Color.lightGray : Color("Color"))
                    .cornerRadius(40)
                    .fullScreenCover(isPresented: $isEvolutionClicked) {
                        CardEvolutionView(seedCard: seedCardManager.seedCardList[Int(seedCardManager.seedCardList.count - Int(currentPageIndex)-1)])
                            .navigationBarHidden(true)
                            .navigationBarTitle("", displayMode:.inline)
                    }
                    
                    .disabled(seedCardManager.seedCardList[Int(seedCardManager.seedCardList.count - Int(currentPageIndex)-1)].seedIsEvolved)
                }
                .frame(width: 300)
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
