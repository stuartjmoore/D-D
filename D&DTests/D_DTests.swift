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
        let character = Player()
        
        character.race = Race(character: character, name: .Human)
        
        let characterClass = Class(character: character, name: .Rogue, hitDie: Die(sides: 8), level: 1)
        character.classes = [characterClass]
        
        character.abilities[.Strength].score = 12
        character.abilities[.Dexterity].score = 17
        character.abilities[.Constitution].score = 13
        character.abilities[.Intelligence].score = 14
        character.abilities[.Wisdom].score = 11
        character.abilities[.Charisma].score = 15
        
        // MARK: -
        
        XCTAssertEqual(character.abilities[.Constitution].modifier, 1, "")
        XCTAssertEqual(character.abilities[.Dexterity].modifier, 3, "")
        
        XCTAssertEqual(character.level, 1, "")
        XCTAssertEqual(character.bonus, 2, "")
        
        XCTAssertEqual(character.hitPointsMax, 10, "")
        
        XCTAssertEqual(character.skills[.Deception].roll, 2, "")
        XCTAssertEqual(character.skills[.Deception].passive, 12, "")
        
        XCTAssert(true, "Pass")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
