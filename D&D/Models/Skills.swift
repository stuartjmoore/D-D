//
//  Skills.swift
//  D&D
//
//  Created by Moore, Stuart on 2/13/15.
//  Copyright (c) 2015 Stuart Moore. All rights reserved.
//

struct Skills {
    
    enum Name {
        case Acrobatics, AnimalHandling, Arcana, Athletics
        case Deception, History, Insight, Intimidation
        case Investigation, Medicine, Nature, Perception
        case Performance, Persuasion, Religion
        case SleightOfHand, Stealth, Survival
    }
    
    struct Skill {
        unowned let character: Player
        let ability: Abilities.Name
        
        var proficient: Proficiency = .None
        var advanced: Bool = false
        
        var roll: Int { return character.abilities[ability].modifier + Int(Float(character.bonus) * proficient.rawValue) }
        var passive: Int { return 10 + roll + (proficient == .Single ? 5 : 0) }
        
        init(character: Player, ability: Abilities.Name, proficient: Proficiency = .None, advanced: Bool = false) {
            self.character = character
            self.ability = ability
            self.proficient = proficient
            self.advanced = advanced
        }
    }
    
    subscript(index: Name) -> Skill {
        get {
            return _skills[index]!
        } set (newSkill) {
            _skills[index] = newSkill
        }
    }
    
    private var _skills: [Name: Skill]
    
    init(character: Player) {
        _skills = [
            .Acrobatics: Skill(character: character, ability: .Dexterity),
            .AnimalHandling: Skill(character: character, ability: .Wisdom),
            .Arcana: Skill(character: character, ability: .Intelligence),
            .Athletics: Skill(character: character, ability: .Strength),
            .Deception: Skill(character: character, ability: .Charisma),
            .History: Skill(character: character, ability: .Intelligence),
            .Insight: Skill(character: character, ability: .Wisdom),
            .Intimidation: Skill(character: character, ability: .Charisma),
            .Investigation: Skill(character: character, ability: .Intelligence),
            .Medicine: Skill(character: character, ability: .Wisdom),
            .Nature: Skill(character: character, ability: .Intelligence),
            .Perception: Skill(character: character, ability: .Wisdom),
            .Performance: Skill(character: character, ability: .Charisma),
            .Persuasion: Skill(character: character, ability: .Charisma),
            .Religion: Skill(character: character, ability: .Intelligence),
            .SleightOfHand: Skill(character: character, ability: .Dexterity),
            .Stealth: Skill(character: character, ability: .Dexterity),
            .Survival: Skill(character: character, ability: .Wisdom)
        ]
    }
    
}
