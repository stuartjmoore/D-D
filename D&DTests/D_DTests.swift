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
        
        character.race = Race(character: character, name: .Halfling)
        
        let characterClass = Class(character: character, name: .Rogue, hitDie: Die(sides: 8), level: 1)
        character.classes = [characterClass]
        
        character.abilities[.Strength].score = 12
        character.abilities[.Dexterity].score = 17
        character.abilities[.Dexterity].proficient = true
        character.abilities[.Constitution].score = 13
        character.abilities[.Intelligence].score = 14
        character.abilities[.Intelligence].proficient = true
        character.abilities[.Wisdom].score = 11
        character.abilities[.Charisma].score = 15
        
        character.skills[.Acrobatics].proficient = .Single
        character.skills[.Deception].proficient = .Single
        character.skills[.Investigation].proficient = .Single
        character.skills[.Performance].proficient = .Single
        character.skills[.Stealth].proficient = .Double
        
        // MARK: -
        
        XCTAssertEqual(character.abilities[.Strength].modifier, 1, "")
        XCTAssertEqual(character.abilities[.Dexterity].modifier, 3, "")
        XCTAssertEqual(character.abilities[.Constitution].modifier, 1, "")
        XCTAssertEqual(character.abilities[.Intelligence].modifier, 2, "")
        XCTAssertEqual(character.abilities[.Wisdom].modifier, 0, "")
        XCTAssertEqual(character.abilities[.Charisma].modifier, 2, "")
        
        XCTAssertEqual(character.abilities[.Strength].savingThrow, 1, "")
        XCTAssertEqual(character.abilities[.Dexterity].savingThrow, 5, "")
        XCTAssertEqual(character.abilities[.Constitution].savingThrow, 1, "")
        XCTAssertEqual(character.abilities[.Intelligence].savingThrow, 4, "")
        XCTAssertEqual(character.abilities[.Wisdom].savingThrow, 0, "")
        XCTAssertEqual(character.abilities[.Charisma].savingThrow, 2, "")
        
        XCTAssertEqual(character.skills[.Acrobatics].roll, 5, "")
        XCTAssertEqual(character.skills[.Deception].roll, 4, "")
        XCTAssertEqual(character.skills[.Investigation].roll, 4, "")
        XCTAssertEqual(character.skills[.Performance].roll, 4, "")
        XCTAssertEqual(character.skills[.Stealth].roll, 7, "")
        
        XCTAssertEqual(character.skills[.Insight].passive, 10, "")
        XCTAssertEqual(character.skills[.Perception].passive, 10, "")
        
        XCTAssertEqual(character.bonus, 2, "")
        
        XCTAssertEqual(character.level, 1, "")
        XCTAssertEqual(character.hitPointsMin, 0, "")
        XCTAssertEqual(character.hitPointsMax, 10, "")
        
        // MARK: -
        
        character.levelUp(.Rogue)
        
        character.armor.body.armorClass = 2
        character.armor.shield.armorClass = 2
        
        // MARK: -
        
        XCTAssertEqual(character.level, 2, "")
        XCTAssertEqual(character.hitPointsMin, 0, "")
        XCTAssertEqual(character.hitPointsMax, 16, "")
        
        XCTAssertEqual(character.armorClass, 4, "")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
