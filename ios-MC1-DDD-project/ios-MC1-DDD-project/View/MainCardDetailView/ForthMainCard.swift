//
//  ForthMainCard.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/11.
//

import SwiftUI

struct ForthMainCard: View {
    var today = Date()
    
    var body: some View {
        ZStack{
            Image("angrySeedDetail")
        }
    }
}

struct ForthMainCard_Previews: PreviewProvider {
    static var previews: some View {
        ForthMainCard()
    }
}
