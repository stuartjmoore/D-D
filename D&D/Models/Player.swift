//
//  Character.swift
//  D&D
//
//  Created by Moore, Stuart on 2/13/15.
//  Copyright (c) 2015 Stuart Moore. All rights reserved.
//

enum Proficiency: Float {
    case None = 0, Half = 0.5, Single = 1, Double = 2
}

struct Alignment {
    enum Order { case Lawful, Neutral, Chaotic }
    enum Altruism { case Good, Neutral, Evil }
    
    let order: Order, altruism: Altruism
}

class Player {
    
    var name: String = ""
    var alignment: Alignment = Alignment(order: .Neutral, altruism: .Neutral)
    
    var race: Race! = nil
    var classes: [Class] = []
    
    lazy var abilities: Abilities = Abilities(character: self)
    lazy var skills: Skills = Skills(character: self)
    
    var bonus: Int { return level < 5 ? 2 : level < 9 ? 3 : level < 13 ? 4 : level < 17 ? 5 : level < 21 ? 6 : 0 }
    
    var level: Int {
        var _level = 0
        for i in 0 ..< classes.count {
            _level += classes[i].level
        }
        return _level
    }
    
    var hitPoints: Int = 0
    var hitPointsMin: Int = 0
    var hitPointsMax: Int {
        var _hitPoints = 0, _constitution = 0
        
        for i in 0 ..< classes.count {
            _hitPoints += classes[i].hitPoints
            _constitution += classes[i].constitution
        }
        
        return _hitPoints + _constitution
    }
    
    var experiencePoints: Int = 0
    var experiencePointsMin: Int = 0
    var experiencePointsMax: Int = 0
    
    var inspired: Bool = false
    
    var speed: Int = 25 // ft/s
    
    var languages: [Language] = []
    
}
