//
//  Character.swift
//  my-duel-app
//
//  Created by user115274 on 1/10/16.
//  Copyright © 2016 Frank. All rights reserved.
//

import Foundation

class Character {
    
    private var _name: String!
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    private var _characterType: String = "Soldier"

    var name: String! {
        get {
            return _name
        }
    }
    
    var hp: Int! {
        get {
            return _hp
        }
        set {
            _hp = newValue
        }
    }
    
    var attackPwr: Int! {
        get {
            return _attackPwr
        }
    }
    
    var characterType: String? {
        get {
            return _characterType
        }
    }
    
    init(name: String, startingHp: Int, attackPwr: Int, characterType: String) {
        self._name = name
        self._hp = startingHp
        self._attackPwr = attackPwr
        self._characterType = characterType
    }
    
    func attack(attackPwr: Int) {
        self._hp -= attackPwr
    }
    
    func isAlive() -> Bool {
        if self._hp <= 0 {
            return false
        } else {
            return true
        }
  }


    
    
    
    
}