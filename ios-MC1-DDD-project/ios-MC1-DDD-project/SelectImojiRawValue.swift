//
//  SelectImojiRawValue.swift
//  MC1Prac
//
//  Created by 이성노 on 2022/04/12.
//

import SwiftUI


enum SelectImojiRawValue: Int {
    case Imoji0 = 0
    case Imoji1
    case Imoji2
    case Imoji3
    case Imoji4
    case Imoji5
    case Imoji6
    case Imoji7
    case Imoji8
    case Imoji9
    case Imoji10
    case Imoji11
    
    func toString() -> String {
        switch self {
        case .Imoji0:
            return "Imoji0"
        case .Imoji1:
            return "Imoji1"
        case .Imoji2:
            return "Imoji2"
        case .Imoji3:
            return "Imoji3"
        case .Imoji4:
            return "Imoji4"
        case .Imoji5:
            return "Imoji5"
        case .Imoji6:
            return "Imoji6"
        case .Imoji7:
            return "Imoji7"
        case .Imoji8:
            return "Imoji8"
        case .Imoji9:
            return "Imoji9"
        case .Imoji10:
            return "Imoji10"
        case .Imoji11:
            return "Imoji11"
        }
    }
}

//
//let randInt = Int.random(in: 0...10)
//image: Image(RandBookImage(rawValue: randInt)!.toString())
