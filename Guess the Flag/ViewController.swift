//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Harsh Verma on 02/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var currentScore = 0
    var countries = [String]()
    var correctAnswer = 0
    var totalQuestion = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //optimise this later
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monacco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
        // Do any additional setup after loading the view.
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased()
    }
    
    
    func startOver() {
        currentScore = 0
        totalQuestion = 0
        askQuestion()
    }
    
    @objc func showScore() {
        let alert = UIAlertController(title: "Score", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Your Score is \(currentScore)", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        totalQuestion += 1
        if sender.tag == correctAnswer {
            title = "Correct"
            currentScore += 1
        }else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            currentScore -= 1
        }
        if totalQuestion < 10 {
            let control = UIAlertController(title: title, message: "Your score is \(currentScore)", preferredStyle: .alert)
            control.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
                self.askQuestion()
            }))
            present(control, animated: true, completion: nil)
        }else {
            let final = UIAlertController(title: "Game Over!", message: "With Score \(currentScore)", preferredStyle: .alert)
            final.addAction(UIAlertAction(title: "Start Again?", style: .default, handler: { _ in
                self.startOver()
            }))
            present(final, animated: true, completion: nil)
        }
        
    }
    
}

