//
//  Card.swift
//  ConcentrationGame
//
//  Created by Ontic on 04/02/22.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var Identifier : Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.Identifier = Card.getUniqueIdentifier()
    }
}
