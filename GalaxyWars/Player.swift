//
//  Player.swift
//  GalaxyWars
//
//  Created by Emanuel  Guerrero on 1/27/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    private var _missileInventoryCount: Int = 0
    
    var name: String {
        get {
            return _name
        }
    }
    
    var missileInventory: Int {
        get {
            return _missileInventoryCount
        }
    }
    
    convenience init(name: String, hp: Int, attackPower: Int) {
        self.init(startingHP: hp, startingAttackPower: attackPower)
        
        _name = name
    }
    
    func addMissileToInventory() {
        _missileInventoryCount++
    }
    
    func removeMissileFromInventory() {
        _missileInventoryCount--
    }
}