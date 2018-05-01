//
//  ViewController.swift
//  Concentration
//
//  Created by Yuhan Lee on 2018-04-30.
//  Copyright © 2018 edu.stanford.cs193p.lecture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    //lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/ 2) --> wouldn't work
    
    //lazy will remove the error of using "cardButtons" before initializing it
    //one restrictions: you can't add a "did set"
    
    //classes get a free init with no arguemnts as long as their vars are initialized
    
    var flipCount = 0 {
        didSet {
            //property observer
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //no need to do flipCount: Int = 0 as Swift is strongly typed..
    //hold option to check type for flipCount
    
    @IBOutlet weak var flipCountLabel: UILabel!
    //"!" is... TBA
    
    @IBOutlet var cardButtons: [UIButton]!
    //same as Array<UIButton>
    //Cmd + click you get a manual to rename...
    //Never rename a value because all UI is connected
    
    @IBAction func touchCard(_ sender: UIButton) {
        // "_" means that there are no args
        flipCount += 1
        //let cardNumber = cardButtons.index(of: sender) --> not set
        //let cardNumber = cardButtons.index(of: sender)! --> will give error if card not in cardButton

        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            
            
            game.chooseCard(at: cardNumber)
        } else {
            print("chosen card was not in cardButton")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            //for index in 0...CardButtons
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                //requires spaces between this tertiary statement
            }
        }
    }
    
    var emojiChoices = ["🎃", "👻", "👿", "👺", "👽", "🤡", "👹", "🤖", "👾"]
    //Array<String> is not necessary....so we ignore

    var emoji = [Int: String]()
    //This is a dictionary struct --> "var emoji = Dictionary<Int,String>()" would work too

    func emoji(for card: Card) -> String {
    //        if emoji[card.identifier] != nil {
    //            return emoji[card.identifier]!
    //        } else {
    //            return "?"
    //        }
        //is same as:
        if emoji[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            // arc4random only works for signed in. Swift doesn't do automatically typed
            // then we convert it again to Int for the random index
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex) //we remove it so emoji won't be repeated
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    func flipCard ( withEmoji emoji: String, on button: UIButton) {
        //Each argument has a name. Both internal and external names
        //withEmoji is external, emoji is internal
        
        if button.currentTitle == emoji {
            
        } else {
           
        }
    }
}

