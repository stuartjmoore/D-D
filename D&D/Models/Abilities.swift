//
//  Abilities.swift
//  D&D
//
//  Created by Moore, Stuart on 2/13/15.
//  Copyright (c) 2015 Stuart Moore. All rights reserved.
//

struct Abilities {
    
    enum Name {
        case Strength, Dexterity, Constitution, Intelligence, Wisdom, Charisma
    }
    
    struct Ability {
        unowned let character: Player
        
        var score: Int = 0
        var proficient: Bool = false
        
        var modifier: Int { return rounddown(score / 2) - 5 }
        var savingThrow: Int { return modifier + (proficient ? character.bonus : 0) }
        
        init(character: Player) {
            self.character = character
        }
    }
    
    subscript(index: Name) -> Ability {
        get {
            return _abilities[index]!
        } set (newAbility) {
            _abilities[index] = newAbility
        }
    }
    
    private var _abilities: [Name: Ability]
    
    init(character: Player) {
        _abilities = [
            .Strength: Ability(character: character),
            .Dexterity: Ability(character: character),
            .Constitution: Ability(character: character),
            .Intelligence: Ability(character: character),
            .Wisdom: Ability(character: character),
            .Charisma: Ability(character: character)
        ]
    }
    
}
