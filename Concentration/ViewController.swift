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
    
    var emojiChoices = ["🎃", "👻", "🎃", "👻"]
    //Array<String> is not necessary....so we ignore
    
    @IBAction func touchCard(_ sender: UIButton) {
        // "_" means that there are no args
        flipCount += 1
        //let cardNumber = cardButtons.index(of: sender) --> not set
        //let cardNumber = cardButtons.index(of: sender)! --> will give error if card not in cardButton

        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButton")
        }
    }
    
    func flipCard ( withEmoji emoji: String, on button: UIButton) {
        //Each argument has a name. Both internal and external names
        //withEmoji is external, emoji is internal
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
}

