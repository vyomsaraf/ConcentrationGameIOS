//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Ontic on 04/02/22.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOnlyOneCardFaceUp : Int?
    
    func chooseCard (at index : Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOnlyOneCardFaceUp, matchIndex != index {
                if cards[matchIndex].Identifier == cards[index].Identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOnlyOneCardFaceUp = nil
            }
            else {
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOnlyOneCardFaceUp = index
            }
        }
    }
    
    func reset(){
        for index in cards.indices{
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        //shuffle cards code
        var lastCardIndex = cards.count - 1
        while lastCardIndex > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(lastCardIndex)))
            cards.swapAt(randomIndex, lastCardIndex)
            lastCardIndex -= 1
        }
    }
    
    init(numberOfPairsOfCard : Int){
        for _ in 1...numberOfPairsOfCard{
            let card  = Card()
            cards += [card, card]
        }
        
    }
}
