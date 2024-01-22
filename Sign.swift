//
//  Sign.swift
//  Rock paper paper
//
//  Created by 8h on 1/22/24.
//

import Foundation
enum GameState{
    case start, win, lose, draw
    
}

enum Sign {
    case fox, monkey, banana
    
    var emoji: String {
        switch self {
        case .fox:
            return "🦊"
        case .monkey:
            return "🐒"
        case .banana:
            return "🍌"
        }
    }
    
    
    
    func checkWin(opponent: Sign) -> GameState {
        if (self == .fox && opponent == .monkey) || (self == .banana && opponent == .fox) || (self == .monkey && opponent == .banana) {
            return .win
        } else if (self == .fox && opponent == .banana) || (self == .banana && opponent == .monkey) || (self == .monkey && opponent == .fox) {
            return .lose
        } else {
            return .draw
        }
    }
    
}
func randomSign() -> Sign {
    
let sign = Int.random(in: 0...2)
    
if sign == 0 {
    return .fox
    
}
else if sign == 1 {
    return .monkey
    
} else {
    return .banana
    
}
    
}

