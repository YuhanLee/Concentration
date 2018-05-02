//
//  Card.swift
//  Concentration
//
//  Created by Yuhan Lee on 2018-05-01.
//  Copyright © 2018 edu.stanford.cs193p.lecture. All rights reserved.
//

import Foundation

struct Card {
    //classes vs struct, 2 major diff
    //1. structs have no inheritance
    //2. structs are value types and classes are reference types
    //structs provides copy-on-write semantics, only when you modify it (doesn't copy all)
    
    //structs get free initializers too but...
    
    //Card is UI independent. No need to display the emoji 
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        //init tend to have same internal/ external names
    }
}
