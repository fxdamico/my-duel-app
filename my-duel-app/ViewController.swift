//
//  ViewController.swift
//  my-duel-app
//
//  Created by user115274 on 1/10/16.
//  Copyright © 2016 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstPlayerNameTxt: UITextField!
    @IBOutlet weak var secondPlayerNameTxt: UITextField!
    @IBOutlet weak var firstPlayerChooseSoldierBtn: UIButton!
    @IBOutlet weak var firstPlayerChooseOrcBtn: UIButton!
    @IBOutlet weak var secondPlayerChooseSoldierBtn: UIButton!
    @IBOutlet weak var secondPlayerChooseOrcBtn: UIButton!
    @IBOutlet weak var fightBtn: UIButton!
    @IBOutlet weak var leftOrcImg: UIImageView!
    @IBOutlet weak var leftSoldierImg: UIImageView!
    @IBOutlet weak var rightSoldierImg: UIImageView!
    @IBOutlet weak var rightOrcImg: UIImageView!
    @IBOutlet weak var leftAttackBtn: UIButton!
    @IBOutlet weak var rightAttackBtn: UIButton!
    @IBOutlet weak var leftHpLbl: UILabel!
    @IBOutlet weak var rightHpLbl: UILabel!
    @IBOutlet weak var gameTxtArea: UIImageView!
    @IBOutlet weak var gameActionLbl: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var playerOneLbl: UILabel!
    @IBOutlet weak var playerTwoLbl: UILabel!
    
    
    var playerOne: Character?
    var playerTwo: Character?
   


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func playerOneChoseSoldierPressed(sender: UIButton!) {
        playerOne = Character(name: firstPlayerNameTxt.text!, startingHp: 100, attackPwr: 20, characterType: "Soldier")
        
    }
    
    @IBAction func playerOneChoseOrcPressed(sender: UIButton!) {
        playerOne = Character(name: firstPlayerNameTxt.text!, startingHp: 100, attackPwr: 20, characterType: "Orc")
    }
    
    @IBAction func playerTwoChoseSoldierPressed(sender: UIButton!) {
        playerTwo = Character(name: secondPlayerNameTxt.text!, startingHp: 100, attackPwr: 20, characterType: "Soldier")
    }
    
    @IBAction func playerTwoChoseOrcPressed(sender: UIButton!) {
        playerTwo = Character(name: secondPlayerNameTxt.text!, startingHp: 100, attackPwr: 20, characterType: "Orc")
    }
    
    func readyToFight() -> Bool {
        if firstPlayerNameTxt.text != "" && secondPlayerNameTxt.text != "" && playerOne?.characterType != "" && playerTwo?.characterType != "" {
            return true
        } else {
            return false
        }
    }
        
        
    @IBAction func fightBtnPressed(sender: UIButton!) {
        if readyToFight() {
            callGameScreenVisuals()
        }
    }
    
    @IBAction func leftAttackBtnPressed(sender: UIButton!) {
        attackBtnPressed(playerOne!, enemy: playerTwo!, isLeft: true)
    }
    
    @IBAction func rightAttackBtnPressed(sender: UIButton!) {
        attackBtnPressed(playerTwo!, enemy: playerOne!, isLeft: false)
    }
    
    func attackBtnReappear() {
        leftAttackBtn.hidden = false
        rightAttackBtn.hidden = false
    }
    
    func attackBtnPressed(attacker: Character, enemy: Character, isLeft: Bool) {
        enemy.attack(attacker.attackPwr)
        gameActionLbl.text = "\(attacker.name) attacked!"
        if isLeft {
            rightHpLbl.text = "\(enemy.hp) HP"
            rightAttackBtn.hidden = true
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "attackBtnReappear", userInfo: nil, repeats: false)
        } else {
            leftHpLbl.text = "\(enemy.hp) HP"
            leftAttackBtn.hidden = true
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "attackBtnReappear", userInfo: nil, repeats: false)
        }
        
        if !enemy.isAlive() {
            if isLeft {
                rightHpLbl.text = "DEAD"
            } else {
                leftHpLbl.text = "DEAD"
            }
            
            gameActionLbl.text = "\(attacker.name) wins!"
            
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "restartAndReturnAppear", userInfo: nil, repeats: false)
        }
    }
    
    func restartAndReturnAppear() {
        restartBtn.hidden = false
        returnBtn.hidden = false
    }
    
    func reset() {
        playerOne!.hp = 100
        playerTwo!.hp = 100
        leftHpLbl.text = "\(playerOne!.hp) HP"
        rightHpLbl.text = "\(playerTwo!.hp) HP"
        gameActionLbl.text = "Fight!"
        restartBtn.hidden = true
        returnBtn.hidden = true
    }
    
    @IBAction func restartBtnPressed(sender: UIButton!) {
        reset()
        
    }
    
    @IBAction func returnBtnPressed(sender: UIButton!) {
        reset()
        callSetupScreenVisuals()
    }
    
    func callSetupScreenVisuals() {
        firstPlayerNameTxt.hidden = false
        secondPlayerNameTxt.hidden = false
        firstPlayerChooseSoldierBtn.hidden = false
        firstPlayerChooseOrcBtn.hidden = false
        secondPlayerChooseSoldierBtn.hidden = false
        secondPlayerChooseOrcBtn.hidden = false
        fightBtn.hidden = false
        
        leftOrcImg.hidden = true
        leftSoldierImg.hidden = true
        rightOrcImg.hidden = true
        rightSoldierImg.hidden = true
        leftHpLbl.hidden = true
        rightHpLbl.hidden = true
        leftAttackBtn.hidden = true
        rightAttackBtn.hidden = true
        restartBtn.hidden = true
        returnBtn.hidden = true
        gameActionLbl.hidden = true
        gameTxtArea.hidden = true
        playerOneLbl.hidden = true
        playerTwoLbl.hidden = true
        
        firstPlayerNameTxt.text = ""
        secondPlayerNameTxt.text = ""
    }
    
    func callGameScreenVisuals() {
        firstPlayerNameTxt.hidden = true
        secondPlayerNameTxt.hidden = true
        firstPlayerChooseSoldierBtn.hidden = true
        firstPlayerChooseOrcBtn.hidden = true
        secondPlayerChooseSoldierBtn.hidden = true
        secondPlayerChooseOrcBtn.hidden = true
        fightBtn.hidden = true
        
        gameTxtArea.hidden = false
        gameActionLbl.hidden = false
        leftHpLbl.hidden = false
        rightHpLbl.hidden = false
        leftAttackBtn.hidden = false
        rightAttackBtn.hidden = false
        playerOneLbl.hidden = false
        playerTwoLbl.hidden = false
        
        playerOneLbl.text = firstPlayerNameTxt.text
        playerTwoLbl.text = secondPlayerNameTxt.text
        
        if playerOne!.characterType == "Soldier" {
            leftSoldierImg.hidden = false
        } else {
            leftOrcImg.hidden = false
        }
        
        if playerTwo!.characterType == "Soldier" {
            rightSoldierImg.hidden = false
        } else {
            rightOrcImg.hidden = false
        }
        
        gameActionLbl.text = "Fight!"
    }
  
    
    
}
