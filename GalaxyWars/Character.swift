//
//  Character.swift
//  GalaxyWars
//
//  Created by Emanuel  Guerrero on 1/27/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int
    private var _attackPower: Int
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHP: Int, startingAttackPower: Int) {
        self._hp = startingHP
        self._attackPower = startingAttackPower
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
}