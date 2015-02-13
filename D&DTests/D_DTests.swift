//
//  D_DTests.swift
//  D&DTests
//
//  Created by Moore, Stuart on 2/13/15.
//  Copyright (c) 2015 Stuart Moore. All rights reserved.
//

import UIKit
import XCTest

class D_DTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testExample() {
        var character = Player()
        
        character.classes = [ Class(character: character, name: "Goblin", hitDie: Die(sides: 8), level: 1)]
        
        character.abilities[.Strength].score = 12
        character.abilities[.Dexterity].score = 17
        character.abilities[.Constitution].score = 13
        character.abilities[.Intelligence].score = 14
        character.abilities[.Wisdom].score = 11
        character.abilities[.Charisma].score = 15
        
        println(character.abilities[.Constitution].modifier)
        println(character.abilities[.Dexterity].modifier)
        
        println(character.classes.count)
        println(character.level)
        
        println(character.hitPointsMax)
        
        println(character.bonus)
        
        println(character.skills[.Deception].roll)
        println(character.skills[.Deception].passive)
        
        XCTAssert(true, "Pass")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
