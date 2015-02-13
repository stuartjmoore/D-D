//
//  Die.swift
//  D&D
//
//  Created by Moore, Stuart on 2/13/15.
//  Copyright (c) 2015 Stuart Moore. All rights reserved.
//

typealias Dice = [Die]

struct Die {
    
    let sides: Int
    
    init(sides: Int = 20) {
        self.sides = sides
    }
    
    func roll() -> Int {
        return random(1...sides)
    }
    
}
