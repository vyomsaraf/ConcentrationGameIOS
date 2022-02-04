//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Ontic on 04/02/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCard: cardButtons.count/2)
    
    private var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    private var emojiChoices = ["👻","🎃","💀","🧙‍♀️","🪦","🕸"]
    private var emoji = [Int:String]()
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func newGameAction(_ sender: Any) {
        game.reset()
        flipCount = 0
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("This card hasnt been equipped with emojis")
        }
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    private func emoji(for card : Card) -> String {
        if emoji[card.Identifier] == nil {
            if !emojiChoices.isEmpty {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.Identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        return emoji[card.Identifier] ?? "?"
    }
    
}

