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

