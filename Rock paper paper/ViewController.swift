//
//  ViewController.swift
//  Rock paper paper
//
//  Created by 8h on 1/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Mainlabel: UILabel!
    
    @IBOutlet weak var LittleLabel: UILabel!
  
    @IBOutlet weak var banana: UIButton!
    
    @IBOutlet weak var fox: UIButton!
    
    @IBOutlet weak var again: UIButton!
    
    @IBOutlet weak var monkey: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(state: .start)

    }
    func play(sign: Sign){
        let ComputerSign = randomSign()
        Mainlabel.text = ComputerSign.emoji
        fox.isEnabled = false
        monkey.isEnabled = false
        banana.isEnabled = false
        
        switch sign{
        case .fox:
            monkey.isHidden = true
            banana.isHidden = true
        case .banana:
            fox.isHidden = true
            monkey.isHidden = true
        case .monkey:
            banana.isHidden = true
            fox.isHidden = true
        }
        let gameState = sign.checkWin(opponent: ComputerSign)
        updateUI(state: gameState)
        
        again.isHidden = false
    }
    func updateUI(state:GameState){
        switch state {
        case .start:
            Mainlabel.text = "🤖"
            again.isHidden = true
            monkey.isEnabled = true
            fox.isEnabled = true
            banana.isEnabled = true
           LittleLabel.text = "Rock, paper, Scissors?"
            view.backgroundColor = UIColor.white
            monkey.isHidden = true
            fox.isHidden = true
            banana.isHidden = true
        case .win:
            LittleLabel.text = "You won!"
            view.backgroundColor = UIColor.green
        case .lose:
            LittleLabel.text = "You lost!"
            view.backgroundColor = UIColor.red
        case .draw:
            LittleLabel.text = "Draw"
            view.backgroundColor = UIColor.gray


            
            
        }
    }
    
    @IBAction func Playagain(_ sender: Any) {
        updateUI(state: .start)
    }
    
    @IBAction func monkey(_ sender: Any) {
        play(sign: Sign.monkey)
    }
    
    @IBAction func banana(_ sender: Any) {
        play(sign: .banana)
    }
    
    @IBAction func fox(_ sender: Any) {
        play(sign: .fox)
    }
}

