//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainBackground: UIImageView!
    
    @IBOutlet weak var banner: UIImageView!
    
    @IBOutlet weak var secondDice: UIImageView!
    
    @IBOutlet weak var firstDice: UIImageView!
    let dices = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]

    override func viewDidLoad() {
        super.viewDidLoad()
        mainBackground.image = UIImage(named: "GreenBackground")
    }

    
    @IBAction func rollButton(_ sender: Any) {
        rollDice()
    }
    func rollDice() {
        let randomDiceOne = Int.random(in: 0..<dices.count)
        let randomDiceTwo = Int.random(in: 0..<dices.count)
    
        firstDice.image = UIImage(named: dices[randomDiceOne])
        secondDice.image = UIImage(named: dices[randomDiceTwo])
        
    }
    
}

