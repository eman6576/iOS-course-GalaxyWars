//
//  ViewController.swift
//  GalaxyWars
//
//  Created by Emanuel  Guerrero on 1/25/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gargoyleEnemyImageView: UIImageView!
    @IBOutlet weak var alienImageView: UIImageView!
    @IBOutlet weak var spaceGroundImageView: UIImageView!
    @IBOutlet weak var missileInventoryLabel: UILabel!
    @IBOutlet weak var enemyHPLabel: UILabel!
    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var launchMissileButton: UIButton!
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var missilePickUpButton: UIButton!
    
    var animatedSpaceGround: Animation!
    var player: Player!
    var enemy: Enemy!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedSpaceGround = Animation(uiViewObject: spaceGroundImageView)
        animatedSpaceGround.startAnimation()
        
        player = Player(name: "TestPlayer", hp: 110, attackPower: 20)
        
        generateRandomEnemy()
        
        printLabel.text = "Tapped the button to attack"
    }
    
    @IBAction func onMissilePickUpButtonTapped(sender: UIButton!) {
        missilePickUpButton.hidden = true
        
        printLabel.text = "Picked up a missile"
        
        player.addMissileToInventory()
        
        missileInventoryLabel.hidden = false
        missileInventoryLabel.text = "\(player.missileInventory) Missle"
        
        launchMissileButton.hidden = false
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func onLanuchMissileButtonTapped(sender: UIButton!) {
        player.removeMissileFromInventory()
        if player.missileInventory <= 0 {
            missileInventoryLabel.hidden = true
            
            launchMissileButton.hidden = true
        }
        
        attackEnemy(100)
    }
    
    @IBAction func attackButtonTapped(sender: UIButton!) {
        attackEnemy(player.attackPower)
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Alien(immuneMax: 10, startingHP: 50, startingAttackPower: 13)
            alienImageView.hidden = false
        } else {
            enemy = Gargoyle(immuneMax: 12, startingHP: 60, startingAttackPower: 15)
            gargoyleEnemyImageView.hidden = false
        }
        
        enemyHPLabel.hidden = false
        enemyHPLabel.text = "\(enemy.hp) HP"
    }
    
    func attackEnemy(attackPower: Int) {
        if enemy.attemptAttack(attackPower) {
            printLabel.text = "Attack \(enemy.type) for \(attackPower) HP"
            enemyHPLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "Attack was unsuccessful"
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            enemyHPLabel.hidden = true
            
            printLabel.text = "Killed \(enemy.type)"
            
            missilePickUpButton.hidden = false
            
            if enemy.type == "Alien"{
                alienImageView.hidden = true
            } else {
                gargoyleEnemyImageView.hidden = true
            }
        }
    }
}

