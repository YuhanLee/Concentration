//
//  Concentration.swift
//  Concentration
//
//  Created by Yuhan Lee on 2018-05-01.
//  Copyright © 2018 edu.stanford.cs193p.lecture. All rights reserved.
//

import Foundation

class Concentration
{
    private var themeList:[Theme] = []
    private var emoji = Theme(cardCoverColor: #colorLiteral(red: 1, green: 0.9690187232, blue: 0.128264078, alpha: 1), gameBackgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardTitles: ["😀","😅","😍","😇","😶","🧐","😉","😬","🤤","🤕","🙄","🤪"])
    private var halloween = Theme(cardCoverColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), gameBackgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardTitles: ["🎃", "👻", "👿", "👺", "👽", "🤡", "👹", "🤖", "👾", "🧠", "😽", "💀"])
    private var food = Theme(cardCoverColor: #colorLiteral(red: 0.4335394965, green: 0.9515516493, blue: 0, alpha: 1), gameBackgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardTitles:  ["🍏","🍎","🍈","🍐","🍒","🍋","🥥","🍉","🍇","🍓","🍍","🍑"])
    private var animal = Theme(cardCoverColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), gameBackgroundColor:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardTitles: ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷"])

    //TODO: put the theme in ThemeList 
    
    
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        var notShuffledCards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card() //intializing one
            notShuffledCards += [card, card] //add a pair in the collection
        }
        for _ in notShuffledCards {
            let randomCardIndex = Int(arc4random_uniform(UInt32(notShuffledCards.count)))
            let randomCard = notShuffledCards.remove(at: randomCardIndex)
            cards.append(randomCard)
        }
    }
}

/* Concept: Struct -is a valut etype so it's supposed to be immutable
 But if we make a struct a var instead of a constant to use the mutating function, ti could work
 */

