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
    func chooseCard(at index: Int) {
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            
//         let matchingCard = card
//            //putting in a card in an array also does copy
//            cards.append(card)
//            cards.append(matchingCard)
        }
        //TODO: shuffle the card

    }
}
