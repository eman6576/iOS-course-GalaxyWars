//
//  Gargoyle.swift
//  GalaxyWars
//
//  Created by Emanuel  Guerrero on 1/28/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import Foundation

class Gargoyle: Enemy {
    private var immuneMax = 20
    
    override var type: String {
        return "Gargoyle"
    }
}