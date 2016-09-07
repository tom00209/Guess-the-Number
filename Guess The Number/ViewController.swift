//
//  ViewController.swift
//  Guess The Number
//
//  Created by yichishao_old on 9/6/16.
//  Copyright © 2016 yichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateRandomNumber()

    }

    
    @IBOutlet weak var guessTextField: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
//    func validateGuess(guess: Int) {
//        if guess < lowerBound || guess > upperBound {
//            print("Your guess should be between 1 and 100!")
//        } else if guess < numberToGuess {
//            print("Higher!")
//        } else if guess > numberToGuess {
//            print("Lower!")
//        } else {
//            print("You win!")
//            numberOfGuesses = 0
//            generateRandomNumber()
//        }
//    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Got it", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats! 🎉", message: "You won with a total of \(numberOfGuesses) guesses", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Play again", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    

    func validateGuess(guess: Int) {
        if guess < lowerBound || guess > upperBound {
            //print("Your guess should be between 1 and 100!")
            showBoundsAlert()
        } else if guess < numberToGuess {
            guessLabel.text = "Higher! ⬆️"
        } else if guess > numberToGuess {
            guessLabel.text = "Lower! ⬇️"
        } else {
            //print("You win!")
            showWinAlert()
            guessLabel.text = "You Win!"
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    //    @IBAction func submitButtonPressed(sender: UIButton) {
//        generateRandomNumber()
//        print("\(numberToGuess)")
//    }
    
    @IBAction func submitButtonPressed(sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                //print(guessInt)
                validateGuess(guessInt)
            }
        }
    }
    
}

