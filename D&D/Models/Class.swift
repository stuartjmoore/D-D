//
//  Class.swift
//  D&D
//
//  Created by Moore, Stuart on 2/13/15.
//  Copyright (c) 2015 Stuart Moore. All rights reserved.
//

struct Class {
    
    enum Name {
        case Barbarian, Bard, Cleric, Druid, Fighter, Monk, Paladin, Ranger, Rogue, Sorcerer, Warlock, Wizard
    }
    
    unowned let character: Player
    let name: Name
    let hitDie: Die
    
    var level: Int
    
    var hitPoints: Int {
        let mod = character.abilities[.Constitution].modifier
        let first = hitDie.sides + mod
        let rest = roundup((hitDie.sides + 1) / 2) + mod
        return first + (rest * (level - 1))
    }
    
    var constitution: Int {
        return level * character.abilities[.Constitution].modifier
    }
    
}
