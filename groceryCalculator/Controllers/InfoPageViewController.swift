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
import MessageUI

class InfoPageViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
   
    
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
    
    @IBOutlet weak var contactOutlet: UIButton!
    @IBOutlet weak var tutorialOutlet: UIButton!
    @IBOutlet weak var reviewOutlet: UIButton!
    
    @IBAction func returnPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.secondarySystemGroupedBackground
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
    
    @IBAction func contactEmailButtonPressed(_ sender: UIButton) {
        sendEmail()
    }
    @IBAction func RateAndReviewButtonPressed(_ sender: UIButton) {
        playSound(sender: 1)
        let appleID = "1562026726"
        let url = "https://itunes.apple.com/app/id\(appleID)?action=wrire-review"
        if let path = URL(string: url) {
            UIApplication.shared.open(path, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func closeButonPressed(_ sender: UIButton) {

        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func clearButonPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.secondarySystemGroupedBackground
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
    
  
    @IBAction func actionButtonTouchedDown(_ sender: UIButton) {
        sender.backgroundColor = UIColor.systemGray3
    }
    
    @IBAction func actionButtonToucheUpOutside(_ sender: UIButton) {
        sender.backgroundColor = UIColor.secondarySystemGroupedBackground
    }
    
    @IBAction func buttonColorTap(_ sender: UIButton) {
        if sender.tag == 1 {
        sender.backgroundColor = UIColor.darkGray
        } else {
            sender.backgroundColor = UIColor.systemGray3
        }
    }
    
    @IBAction func numberTouchedUpOutside(_ sender: UIButton) {
        if sender.tag == 1 {
        sender.backgroundColor = UIColor.secondarySystemGroupedBackground
        }
        else {
            sender.backgroundColor = UIColor.systemGray3
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.secondarySystemGroupedBackground
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
        contactOutlet.isHidden = false
        tutorialOutlet.isHidden = false
        reviewOutlet.isHidden = false
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseInOut, animations: {
            self.keyBoard.alpha = 0
            self.contactOutlet.alpha = 1
            self.tutorialOutlet.alpha = 1
            self.reviewOutlet.alpha = 1
            self.view.layoutIfNeeded()
        }) { (Bool) in
            self.keyBoard.isHidden = true
            
        }
    }
    
    
    func keyBoardAppears() {
        
        keyBoard.isHidden = false
        UIView.animate(withDuration: 0.13, delay: 0.0, options: .curveEaseInOut,  animations: {
            self.contactOutlet.alpha = 0
            self.tutorialOutlet.alpha = 0
            self.reviewOutlet.alpha = 0
            self.keyBoard.alpha = 1
        })
        contactOutlet.isHidden = true
        tutorialOutlet.isHidden = true
        reviewOutlet.isHidden = true
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
    
    @IBAction func unwindToInfo(_ sender: UIStoryboardSegue) {
        
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
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["contacteverycartapp@gmial.com"])
            mail.setSubject("Regarding Every Cart App (Ver 1.0)")
            
            present(mail, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Unable To Send Email", message: "Your settings do not permit Email messages to me sent from this app. You can contact me at 'everycartapp@gmail.com'", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}
