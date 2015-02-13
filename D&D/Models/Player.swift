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

class Player {
    
    var name: String = ""
    
    var races: [Race] = []
    var classes: [Class] = []
    
    var level: Int {
        var _level = 0
        for i in 0 ..< classes.count {
            _level += classes[i].level
        }
        return _level
    }
    
    var classesHP: Int {
        var _hitPoints = 0
        for i in 0 ..< classes.count {
            _hitPoints += classes[i].hitPoints
        }
        return _hitPoints
    }
    
    var classesCon: Int {
        var _constitution = 0
        for i in 0 ..< classes.count {
            _constitution += classes[i].constitution
        }
        return _constitution
    }
    
    lazy var abilities: Abilities = Abilities(character: self)
    lazy var skills: Skills = Skills(character: self)
    
    var hitPoints: Int = 0
    var hitPointsMin: Int = 0
    var hitPointsMax: Int { return classesHP + classesCon }
    
    var experiencePoints: Int = 0
    var experiencePointsMin: Int = 0
    var experiencePointsMax: Int = 0
    
    var speed: Int = 25 // ft/s
    
    var languages: [Language] = []
    
    var bonus: Int { return level < 5 ? 2 : level < 9 ? 3 : level < 13 ? 4 : level < 17 ? 5 : level < 21 ? 6 : 0 }
    
}
