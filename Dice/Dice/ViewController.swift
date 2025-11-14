//
//  ViewController.swift
//  Dice
//
//  Created by Артур Култышев on 22.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!

    private let diceImages = ["DiceOne","DiceTwo","DiceThree","DiceFour","DiceFive","DiceSix"]

    override func viewDidLoad() {
        super.viewDidLoad()
        leftDiceImageView.image = UIImage(named: "DiceOne")
        rightDiceImageView.image = UIImage(named: "DiceOne")
    }

    @IBAction func rollDice(_ sender: UIButton) {
        rollDices()
    }
    
    private func rollDices() {
        let leftName = diceImages.randomElement() ?? "DiceOne"
        let rightName = diceImages.randomElement() ?? "DiceOne"

        leftDiceImageView.image = UIImage(named: leftName) 
        rightDiceImageView.image = UIImage(named: rightName)
    }
}


