//
//  InfoPageViewController.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/6/21.
//
protocol infoPageDelegate: class {
    func audioSwitch(onOff: Bool)
    func budgetLimit(budget: Int)
    func sortSwitch(onOff: Bool)
    
    
    
    
}

import UIKit
import AudioToolbox


class InfoPageViewController: UIViewController {
    
    
    
    @IBOutlet weak var sortCheck: UISwitch!
    @IBOutlet weak var audioSwitch: UISwitch!
    var budgetLimit: Int = 0
    var BudgetString = ""
    
    var sortHolder = true
    var switchHolder = false
    var delegate: infoPageDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioSwitch.isOn = switchHolder
        sortCheck.isOn = sortHolder
        budgetOutlet.setTitle(formatter(int: budgetLimit), for: .normal)
        
    }
    
    
    @IBAction func returnPressed(_ sender: UIButton) {
        playSound(sender: sender.tag)
        keyBoardDissapears()
      
    }
    
    
    @IBOutlet weak var budgetOutlet: UIButton!
    @IBOutlet weak var keyBoard: UIView!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBAction func budgetButton(_ sender: UIButton) {
        playSound(sender: sender.tag)
        budgetOutlet.setTitle(formatter(int: budgetLimit), for: .normal)
        
        keyBoardAppears()
      
    }
    
    
    @IBAction func closeButonPressed(_ sender: UIButton) {
//       performSegue(withIdentifier: "fromInfoToHome", sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func clearButonPressed(_ sender: UIButton) {
        playSound(sender: sender.tag)
        budgetLimit = 0
        BudgetString = ""
        budgetLabel.text = "Budget: \(formatter(int: budgetLimit))"
        budgetOutlet.setTitle("$0.00", for: .normal)
        delegate.budgetLimit(budget: 0)
    }
    
    @IBAction func sortButtonPressed(_ sender: UISwitch) {
        delegate!.sortSwitch(onOff: sender.isOn)
    }
    @IBAction func audioButtonPressed(_ sender: UISwitch) {
        
        delegate!.audioSwitch(onOff: sender.isOn)
        if sender.isOn {
            playSound(sender: 0)
        }
        
    }
    
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if BudgetString.count >= 7 {
                return
            } else {
                playSound(sender: sender.tag)
            BudgetString = BudgetString + numValue
            guard let number = Int(BudgetString) else {
                fatalError("Cannot convert string to Int")
            }
            budgetLimit = number
            print(budgetLimit)
            budgetOutlet.setTitle(formatter(int: number), for: .normal)
            budgetLabel.text = "Budget: \(formatter(int: number))"
            delegate.budgetLimit(budget: number)
            }
        }
    }
    
    
    
    func formatter(int: Int) -> String {
        let string = String(format: "%.2f", Double(int) * 0.01)
        return String("$\(string)")
    }
    
    
    func keyBoardDissapears() {
        
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseInOut, animations: {
            self.keyBoard.alpha = 0
            self.view.layoutIfNeeded()
        }) { (Bool) in
            self.keyBoard.isHidden = true
        }
    }
    
    
    func keyBoardAppears() {
        
        keyBoard.isHidden = false
        UIView.animate(withDuration: 0.13, delay: 0.0, options: .curveEaseInOut,  animations: {
            
            self.keyBoard.alpha = 1
        })
    }
    override func viewWillDisappear(_ animated: Bool) {
        performSegue(withIdentifier: "fromInfoToHome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromInfoToHome" {
            let vc = segue.destination as! ViewController
            vc.sortSwitch = sortHolder
        }
    }
    
    func playSound(sender: Int) {
        if audioSwitch.isOn {
            if sender == 1 {
       AudioServicesPlaySystemSound(1104)
            }
            else {
                AudioServicesPlaySystemSound(1105)
            }
            

        }
        else {
            return
        }
    }
    
    
}
