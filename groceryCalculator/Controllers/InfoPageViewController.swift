//
//  InfoPageViewController.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/6/21.
//
protocol infoPageDelegate: class {
    func audioSwitch(onOff: Bool)
    func budgetLimit(budget: Int)
    
    
    
    
}

import UIKit


class InfoPageViewController: UIViewController {
    
    
    
    @IBOutlet weak var audioSwitch: UISwitch!
    var budgetLimit: Int = 0
    var BudgetString = ""
    
    var switchHolder = false
    var delegate: infoPageDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioSwitch.isOn = switchHolder
        budgetOutlet.setTitle(formatter(int: budgetLimit), for: .normal)
        
    }
    
    
    @IBAction func returnPressed(_ sender: UIButton) {
        keyBoardDissapears()
      
    }
    
    
    @IBOutlet weak var budgetOutlet: UIButton!
    @IBOutlet weak var keyBoard: UIView!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBAction func budgetButton(_ sender: UIButton) {
        
        budgetOutlet.setTitle(formatter(int: budgetLimit), for: .normal)
        
        keyBoardAppears()
      
    }
    
    
    @IBAction func clearButonPressed(_ sender: UIButton) {
        budgetLimit = 0
        BudgetString = ""
        budgetLabel.text = "Budget: \(formatter(int: budgetLimit))"
        budgetOutlet.setTitle("$0.00", for: .normal)
        delegate.budgetLimit(budget: 0)
    }
    
    @IBAction func audioButtonPressed(_ sender: UISwitch) {
        
        delegate!.audioSwitch(onOff: sender.isOn)
    }
    
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if BudgetString.count >= 7 {
                return
            } else {
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
    
    
}
