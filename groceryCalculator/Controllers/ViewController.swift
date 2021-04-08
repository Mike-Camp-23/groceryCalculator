//
//  ViewController.swift
//  groceryCalculator
//
//  Created by Michael Camp on 3/30/21.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
  
    
    let dataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("GroceryListArray")
    let defaults = UserDefaults.standard

    var budgetLimit = 0
    var audio = false
    var audioPlayer: AVAudioPlayer!
    var shoppingList: [ShoppingItem] = [
        ShoppingItem(item: "Spaghetti", check: false),
        ShoppingItem(item: "Cheese", check: false),
        ShoppingItem(item: "Pasta", check: true)
    
    ]
    
    var itemAray = [ShoppingItem]()
    
    
    var currentString = ""
    var currentInt: Int = 0
    
    
    var totalInt: Int = 0

    @IBOutlet weak var checlMarkOutlet: UIButton!
    
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var topViewConstraint: NSLayoutConstraint!
   //
    @IBOutlet weak var topViewTopEdge: NSLayoutConstraint!
    //
   
    
    @IBOutlet weak var topEdgeConst: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let items = defaults.array(forKey: "GroceryListArray") as? [ShoppingItem] {
//            itemAray = items
//        }
        totalInt = defaults.integer(forKey: "total")
        totalLabel.text = "Total: \(formatter(int: totalInt))"
       
        audio = defaults.bool(forKey: "audio")
        budgetLimit = defaults.integer(forKey: "budgetLimit")
        updateBudgetColor()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.allowsMultipleSelectionDuringEditing = false
        loadItems() 
    }
    
    
    @IBAction func checkmarkPressed(_ sender: UIButton) {
        uncheckMark()
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {

        playSound()
        
        if currentString.count >= 7 {
            return
        } else {
       if let numValue = sender.currentTitle {
        
        currentString = currentString + numValue
        guard let number = Int(currentString) else {
            fatalError("Cannot convert String Int")
        }
        currentLabel.text = formatter(int: number)
        }
        }
    }
     
    @IBAction func infoButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToInfo", sender: self)
        
    }
    
    
    @IBAction func showListButton(_ sender: UIButton) {
        
       
       
        if lowerView.isHidden == true {
            listAnimationClosed()
        } else {
            listAnimationOpen()
//        currentInt = 0
//        currentString = ""
//        currentLabel.text = "$0.00"
        }
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
       
        if let number = Int(currentString) {
            playSound()
        totalInt += number
        totalLabel.text = formatter(int: totalInt)
        currentString = ""
        currentInt = 0
        currentLabel.text = "$0.00"
            saveTotal(totalInt)
            updateBudgetColor()
            
        
        }
        
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        if let number = Int(currentString) {
        totalInt -= number
            
        totalLabel.text = formatter(int: totalInt)
        currentString = ""
        currentInt = 0
        currentLabel.text = "$0.00"
            saveTotal(totalInt)
            updateBudgetColor()
        }
    }
    @IBAction func clearCurrentLinePressed(_ sender: UIButton) {
        currentInt = 0
        currentString = ""
        currentLabel.text = "$0.00"
    }
    
    
    @IBAction func clearAllPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Clear" , message: "Are you sure you want to clear", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Clear", style: .default) { (action) in
            self.totalInt = 0
            self.saveTotal(self.totalInt)
            self.totalLabel.text = "$0.00"
            self.updateBudgetColor()
        }
        
        alert.addAction((UIAlertAction(title: "Cancel", style: .cancel, handler: nil)))
        alert.addAction(action)
        present(alert, animated: false, completion:
                updateBudgetColor)
        
    }
    
    
    
    func formatter(int: Int) -> String {
        let string = String(format: "%.2f", Double(int) * 0.01)
        return String("$\(string)")
    }
    
    func playSound() {
        if audio == true {
        
        let url = Bundle.main.url(forResource: "DripSound2", withExtension: "m4a")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
        }
        else {
            return
        }
    }
    

    @IBAction func addListItem(_ sender: UIButton) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add To Shopping List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            
            let newItem = ShoppingItem(item: textField.text ?? "New Item", check: false)
            
            self.itemAray.append(newItem)
            
            self.saveItems()
           
            self.tableView.reloadData()
            
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField { (alertTextField) in
            alertTextField.autocapitalizationType = .words
            alertTextField.autocorrectionType = .default
            
            alertTextField.placeholder = "New Item"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func shoppingListPressed(_ sender: UIButton) {
        listAnimationOpen()
    
    }
    
    
    
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemAray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let item = itemAray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = item.item
        cell.accessoryType = item.check ? .checkmark : .none
        
        return cell
        }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemAray[indexPath.row].check = !itemAray[indexPath.row].check
        tableView.deselectRow(at: indexPath, animated: true)
        saveItems()
      
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemAray.remove(at: indexPath.row)
            saveItems()
          
            
        }
    }
    
    
}
    
extension ViewController: UITableViewDelegate {

  
    
        

        
        

    
    
    
    
    func updateBudgetColor() {
        if budgetLimit == 0 {
            totalLabel.backgroundColor = .systemGray
        }
        else if totalInt >= budgetLimit {
            totalLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        else if Double(totalInt) >= Double(budgetLimit) * 0.8 {
                totalLabel.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        else {
            totalLabel.backgroundColor = .systemGray
            }
            
        }
    
    
    
    
    
    func listAnimationOpen() {
        self.lowerView.isHidden = true
        self.infoButton.isHidden = false
        self.checlMarkOutlet.isHidden = false
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut,  animations: {

            self.lowerView.alpha = 0
            
            
            self.topEdgeConst.constant = 42
            self.topViewConstraint.constant = 0
            self.currentLabel.alpha = 0
            self.infoButton.alpha = 1
            self.checlMarkOutlet.alpha = 1
            self.view.layoutIfNeeded()
            
            
            
        }) { (value: Bool) in
           
        }
//        UIView.animate(withDuration: 0.3, delay: 0.2, options: .curveEaseInOut, animations: {
//            self.topEdgeConst.constant = 42
//            self.topViewConstraint.constant = 0
//            self.currentLabel.alpha = 0
//            self.infoButton.alpha = 1
////
//            self.view.layoutIfNeeded()
//        })
        

    }
    
    func listAnimationClosed() {
        lowerView.isHidden = false
        checlMarkOutlet.isHidden = false
        infoButton.isHidden = true
       
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            self.topViewConstraint.constant = 275
            self.topEdgeConst.constant = 5
            self.currentLabel.alpha = 1
            self.infoButton.alpha = 0
            self.view.layoutIfNeeded()
            self.lowerView.alpha = 1
            self.checlMarkOutlet.alpha = 0
            
        }) { (value: Bool) in
            

            
        }
//        UIView.animate(withDuration: 0.13, delay: 0.12, options: .curveEaseInOut,  animations: {
            
            
//        })
    }
    
    func uncheckMark() {
        for item in 0..<itemAray.count {
            itemAray[item].check = false
            saveItems()
        
            
        }
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data =  try encoder.encode(itemAray)
            try data.write(to: dataPath!)
        } catch {
            print("error in coding array, \(error)")
        }
        tableView.reloadData()
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataPath!) {
            let decoder = PropertyListDecoder()
            do {
            itemAray = try decoder.decode([ShoppingItem].self, from: data)
            } catch {
                print("There was an error loading the data\(error)")
            }
        }
    }
    
}

extension ViewController: infoPageDelegate {
    func audioSwitch(onOff: Bool) {
        audio = onOff
        defaults.setValue(onOff, forKey: "audio")
    }
    
    func budgetLimit(budget: Int) {
        budgetLimit = budget
        print("budget limit set: \(budgetLimit)")
        updateBudgetColor()
        defaults.setValue(budget, forKey: "budgetLimit")
    }
    
    func saveTotal(_ total: Int) {
        defaults.setValue(total, forKey: "total")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToInfo" {
            let vc = segue.destination as! InfoPageViewController
            vc.switchHolder = audio
            vc.budgetLimit = budgetLimit
            vc.delegate = self
        }
        
    }
    
}
