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
    //Think: what is its public API for the methods
    //We want to design the methods first because we have to be clear about what we need this class for
    
    //creating instance of a class
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    //If no card faced up, this will be "not set"
    
    
    /* 3 scenarios
     1. no cards faced up
     2. 2 cards faced up--> need to flip 2 back
     3. 1 card faced up--> now we need to check if match */
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched { //ignoring all matched cards
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { //checking if can match
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else { // either no card or two cards face up
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        //         let matchingCard = card
        //            //putting in a card in an array also does copy
        //            cards.append(card)
        //            cards.append(matchingCard)
        //TODO: shuffle the card
    }
}
