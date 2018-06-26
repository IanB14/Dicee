//
//  ViewController.swift
//  Dicee
//
//  Created by Ian Burke on 10/06/2018.
//  Copyright © 2018 Ian Burke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variable/Constant declarations
    var randomDiceIndexOne: Int = 0
    var randomDiceIndexTwo: Int = 0

    let diceArray = ["dice1", "dice2", "dice3",
                     "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomiseDice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func rollButtonPressed(_ sender: UIButton) {
        randomiseDice()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        randomiseDice()
    }
    
    func randomiseDice(){
        // * arc4random_uniform is a part of UIKit
        // * It returns a UInt32, so it needs to be cast to an Int (U stands for unsigned)
        randomDiceIndexOne = Int(arc4random_uniform(6)) + 1
        randomDiceIndexTwo = Int(arc4random_uniform(6)) + 1
        total.text = "Total: \(randomDiceIndexOne + randomDiceIndexTwo)"
    
        print("Dice One: \(randomDiceIndexOne)\nDice Two: \(randomDiceIndexTwo)")
    
        // Use UIElement.Attribute to change things at runtime
        // This is my way of doing things - Angela does it differently,
        // using arrays.
        diceImageView1.image = UIImage(named: "dice\(randomDiceIndexOne)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceIndexTwo)")
    
        // Angela's way, using arrays. Note that this will throw an indexOutOfBounds exception because I added the +1s in randomDiceIndex1/2
        //diceImageView1.image = UIImage(named: diceArray[randomDiceIndexOne])
    }
}

