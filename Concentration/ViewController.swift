//
//  ViewController.swift
//  Concentration
//
//  Created by Yuhan Lee on 2018-04-30.
//  Copyright © 2018 edu.stanford.cs193p.lecture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0
    //no need to do flipCount: Int = 0 as Swift is strongly typed..
    //hold option to check type for flipCount
    
    @IBOutlet weak var flipCountLabel: UILabel!
    //"!" is... TBA
    
    @IBAction func touchCard(_ sender: UIButton) {
        // "_" means that there are no args
        flipCount += 1
        flipCard(withEmoji: "👻", on: sender)
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCount += 1
        flipCard(withEmoji: "🎃", on: sender)

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

