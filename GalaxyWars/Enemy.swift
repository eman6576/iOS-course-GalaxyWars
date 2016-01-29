//
//  Enemy.swift
//  GalaxyWars
//
//  Created by Emanuel  Guerrero on 1/28/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import Foundation

class Enemy: Character {
    private var _immuneMax = 15
    
    var immuneMax: Int {
        get {
            return _immuneMax
        }
    }
    
    var type: String {
        return "Grunt"
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower > self.immuneMax {
            return super.attemptAttack(attackPower)
        } else {
            return false
        }
    }
}