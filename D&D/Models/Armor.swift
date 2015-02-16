//
//  Armor.swift
//  D&D
//
//  Created by Stuart Moore on 2/15/15.
//  Copyright (c) 2015 Stuart Moore. All rights reserved.
//

import UIKit

struct Armor {
        
    enum Name {
        case None
    }
    
    enum Type {
        case None, Light, Medium, Heavy
    }
    
    struct Worn {
        unowned let character: Player
        let name: Name = .None
        let type: Type = .None
        let weight: Double = 0
        var disadvantage: Bool = false
        
        var armorClass: Int = 0
        
        var dexterity: Int {
            return type == .Heavy ? 0 : type == .Medium ? 2 : character.abilities[.Dexterity].modifier
        }
        
        init(character: Player) {
            self.character = character
        }
    }
    
    unowned let character: Player
    var body: Worn
    var shield: Worn
    
    var armorClass: Int {
        return body.armorClass + shield.armorClass
    }
    
    var dexterity: Int {
        return min(body.dexterity, character.abilities[.Dexterity].modifier)
    }
    
    var weight: Double {
        return body.weight + shield.weight
    }
    
    init(character: Player) {
        self.character = character
        self.body = Worn(character: character)
        self.shield = Worn(character: character)
    }
    
}
