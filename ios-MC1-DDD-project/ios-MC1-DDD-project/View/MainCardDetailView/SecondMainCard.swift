//
//  SecondMainCard.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/11.
//

import SwiftUI

struct SecondMainCard: View {
    var today = Date()
    
    var body: some View {
        ZStack{
            Image("waterSeedDetail")
        }
    }
}

struct SecondMainCard_Previews: PreviewProvider {
    static var previews: some View {
        SecondMainCard()
    }
}
