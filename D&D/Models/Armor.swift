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
