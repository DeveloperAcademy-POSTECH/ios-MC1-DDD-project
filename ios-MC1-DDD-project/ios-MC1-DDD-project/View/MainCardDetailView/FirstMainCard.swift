//
//  FirstMainCard.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/11.
//

import SwiftUI

struct FirstMainCard: View {
    var today = Date()
    
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
        ZStack {
            VStack {
                ZStack {
                    Image("melongSeedDetail")
                    ZStack {
                        VStack {
                            Text("Apr")
                                .font(.system(size: 28, weight: .ultraLight))
                                .padding(.top, -200)
                                .padding(.leading, -130)
                                .foregroundColor(Color.init(red: 153/255, green: 135/255, blue: 195/255))
                                
                            Text(today, formatter: MainPageView.dayDateFormat)
                                .font(.system(size: 40, weight: .thin))
                                .padding(.top, -180)
                                .padding(.leading, -130)
                                .foregroundColor(Color.init(red: 153/255, green: 135/255, blue: 195/255))
                        }
                    }
                }
            }
        }
    }
}


struct FirstMainCard_Previews: PreviewProvider {
    static var previews: some View {
        FirstMainCard()
    }
}
