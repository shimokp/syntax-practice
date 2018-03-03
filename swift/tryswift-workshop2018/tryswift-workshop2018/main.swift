//
//  main.swift
//  tryswift-workshop2018
//
//  Created by 下村一将 on 2018/03/03.
//  Copyright © 2018年 kazu. All rights reserved.
//

// Mutable Classes
struct P01 {
    class Character: CustomStringConvertible {
        var description: String {
            return """
\(self.name)
HP \(self.hp)
MP \(self.mp)
"""
        }

        let name: String
        var hp: Int
        var mp: Int
        let attack: Int
        let defense: Int

        init(name: String, hp: Int, mp: Int, attack: Int, defense: Int) {
            self.name = name
            self.hp = hp
            self.mp = mp
            self.attack = attack
            self.defense = defense
        }

        func attack(_ attack: Int) -> Int {
            let a = (attack - self.defense) / 2
            self.hp -= (attack - self.defense) / 2
            return a
        }
    }

    static func main() {
        let hero = Character(name: "ゆうしゃ", hp: 153, mp: 25, attack: 162, defense: 97)
        let archfiend = Character(name: "まおう", hp: 999, mp: 99, attack: 185, defense: 58)

        print(hero.description)
        print()

        print("\(archfiend.name)のこうげき。")
        let damage = hero.attack(archfiend.attack)
        print("\(hero.name)に\(damage)のダメージ！")
        print()

       print(hero.description)
    }
}

struct P02 {
    // Immutable(不変)
    class Character: CustomStringConvertible {
        var description: String {
            return """
            \(self.name)
            HP \(self.hp)
            MP \(self.mp)
            """
        }

        let name: String
        let hp: Int
        let mp: Int
        let attack: Int
        let defense: Int

        init(name: String, hp: Int, mp: Int, attack: Int, defense: Int) {
            self.name = name
            self.hp = hp
            self.mp = mp
            self.attack = attack
            self.defense = defense
        }

//        func damage(attack: Int) -> (charactar: Character, damage: Int) {
//            let damage = (attack - defense) / 2
//            return (Character(name: name, hp: hp-damage, mp: mp, attack: self.attack, defense: self.defense), damage)
//        }

        func update(hp: Int? = nil, mp: Int? = nil) -> Character {
            return Character(name: name, hp: hp ?? self.hp, mp: mp ?? self.mp, attack: attack, defense: defense)
        }
    }

    static func main() {
        var hero = Character(name: "Hero" /* "ゆうしゃ" */, hp: 153, mp: 25, attack: 162, defense: 97)
        var archfiend = Character(name: "Archfiend" /* "まおう" */, hp: 999, mp: 99, attack: 185, defense: 58)

        print(hero.description)
        print()

        print("\(archfiend.name)のこうげき。")
        let damage = (archfiend.attack - hero.defense) / 2
//        let tup = hero.damage(attack: archfiend.attack)
//        hero = tup.charactar
        hero = hero.update(hp: hero.hp - damage, mp: nil)
        print("\(hero.name)に\(damage)のダメージ！")
        print()

        print(hero.description)
    }
}

struct P03 {
    struct Character: CustomStringConvertible {
        var description: String {
            return """
            \(self.name)
            HP \(self.hp)
            MP \(self.mp)
            """
        }

        let name: String
        var hp: Int
        var mp: Int
        let attack: Int
        let defense: Int

        init(name: String, hp: Int, mp: Int, attack: Int, defense: Int) {
            self.name = name
            self.hp = hp
            self.mp = mp
            self.attack = attack
            self.defense = defense
        }
    }

    static func main() {
        var hero = Character(name: "Hero" /* "ゆうしゃ" */, hp: 153, mp: 25, attack: 162, defense: 97)
        var archfiend = Character(name: "Archfiend" /* "まおう" */, hp: 999, mp: 99, attack: 185, defense: 58)

        print(hero.description)
        print()

        print("\(archfiend.name)のこうげき。")
        let damage = (archfiend.attack - hero.defense) / 2
        hero.hp -= damage
        print("\(hero.name)に\(damage)のダメージ！")
        print()

        print(hero.description)
    }
}

struct P04 {
    class Character {
        let name: String
        var hp: Int
        var mp: Int
        let attack: Int
        let defense: Int

        init(name: String, hp: Int, mp: Int, attack: Int, defense: Int) {
            self.name = name
            self.hp = hp
            self.mp = mp
            self.attack = attack
            self.defense = defense
        }
    }

    func performAttack(by character: Character, to target: Character) {
        let damage = (character.attack - target.defense) / 2
        target.hp -= damage
    }

    func main() {
        let hero = Character(name: "Hero" /* "ゆうしゃ" */, hp: 153, mp: 25, attack: 162, defense: 97)
        let archfiend = Character(name: "Archfiend" /* "まおう" */, hp: 999, mp: 99, attack: 185, defense: 58)

        print(hero.name)
        print("HP \(hero.hp)")
        print()

        performAttack(by: hero, to: archfiend)
        performAttack(by: archfiend, to: hero)

        print(hero.name)
        print("HP \(hero.hp)")
        print()
    }
}

struct P05 {
    class Character {
        // var があればMutableClass, letだけならImutableClass
        let name: String
        let hp: Int
        let mp: Int
        let attack: Int
        let defense: Int

        init(name: String, hp: Int, mp: Int, attack: Int, defense: Int) {
            self.name = name
            self.hp = hp
            self.mp = mp
            self.attack = attack
            self.defense = defense
        }

        func copy(hp: Int? = nil, mp: Int? = nil) -> Character {
            return Character(
                name: self.name,
                hp: hp ?? self.hp,
                mp: mp ?? self.mp,
                attack: self.attack,
                defense: self.defense
            )
        }
    }

    func performAttack(by character: Character, to target: Character) -> Character {
        let damage = (character.attack - target.defense) / 2
        return target.copy(hp: target.hp - damage, mp: target.mp)
    }

    func main() {
        var hero = Character(name: "Hero" /* "ゆうしゃ" */, hp: 153, mp: 25, attack: 162, defense: 97)
        var archfiend = Character(name: "Archfiend" /* "まおう" */, hp: 999, mp: 99, attack: 185, defense: 58)

        print(hero.name)
        print("HP \(hero.hp)")
        print()

        archfiend = performAttack(by: hero, to: archfiend)
        hero = performAttack(by: archfiend, to: hero)

        print(hero.name)
        print("HP \(hero.hp)")
        print()
    }
}

struct P06 {
    struct Character {
        // var があればMutableClass, letだけならImutableClass
        let name: String
        var hp: Int
        var mp: Int
        let attack: Int
        let defense: Int

        init(name: String, hp: Int, mp: Int, attack: Int, defense: Int) {
            self.name = name
            self.hp = hp
            self.mp = mp
            self.attack = attack
            self.defense = defense
        }

        func copy(hp: Int? = nil, mp: Int? = nil) -> Character {
            return Character(
                name: self.name,
                hp: hp ?? self.hp,
                mp: mp ?? self.mp,
                attack: self.attack,
                defense: self.defense
            )
        }
    }

    func performAttack(by character: Character, to target: inout Character) {
        let damage = (character.attack - target.defense) / 2
        target.hp -= damage
    }

    func main() {
        var hero = Character(name: "Hero" /* "ゆうしゃ" */, hp: 153, mp: 25, attack: 162, defense: 97)
        var archfiend = Character(name: "Archfiend" /* "まおう" */, hp: 999, mp: 99, attack: 185, defense: 58)

        print(hero.name)
        print("HP \(hero.hp)")
        print()

        performAttack(by: hero, to: &archfiend)
        performAttack(by: archfiend, to: &hero)

        print(hero.name)
        print("HP \(hero.hp)")
        print()
    }
}

P06().main()
