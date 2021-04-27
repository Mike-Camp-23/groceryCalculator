//
//  ViewController.swift
//  groceryCalculator
//
//  Created by Michael Camp on 3/30/21.
//

import UIKit
import AudioToolbox



class ViewController: UIViewController {

    
    
    var newID = 1
    var itemAray = [ShoppingItem]()
    var sortableArray = [ShoppingItem]()
    var listArray = [String]()
    var currentShoppingList = "All Lists"
    
    
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let dataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("GroceryListArray")
    
    let listDataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ShoppingListArray")
    let defaults = UserDefaults.standard
    var budgetLimit = 0
    var audio = false
    var sortSwitch = true
//    var shoppingList: [ShoppingItem] = [
//        ShoppingItem(item: "Spaghetti", check: false),
//        ShoppingItem(item: "Cheese", check: false),
//        ShoppingItem(item: "Pasta", check: true)
//
//    ]
    
    
    
    
    var currentString = ""
    var currentInt: Int = 0
    
    
    var totalInt: Int = 0

    @IBOutlet weak var checlMarkOutlet: UIButton!
    
    @IBOutlet weak var removeAllChecksOutlet: UIButton!
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var topViewConstraint: NSLayoutConstraint!
   //
   
//        @IBOutlet weak var topViewTopEdge: NSLayoutConstraint!
    @IBOutlet weak var lowerViewLeading: NSLayoutConstraint!

    @IBOutlet weak var lowerViewTrailing: NSLayoutConstraint!

//    @IBOutlet weak var topEdgeConst: NSLayoutConstraint!
    
    @IBOutlet weak var currtentListLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
   static let listArrayKey = ""
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentShoppingList)
        
//
        totalInt = defaults.integer(forKey: "total")
        totalLabel.text = "\(formatter(int: totalInt))"
       
        audio = defaults.bool(forKey: "audio")
        let hasLaunched = defaults.bool(forKey: "savedFirstData")
        if !hasLaunched {
            listArray.append(currentShoppingList)
            saveListArray()
            defaults.setValue(true, forKey: "savedFirstData")
            defaults.setValue(sortSwitch, forKey: "sortSwitch")
            defaults.setValue(currentShoppingList, forKey: "currentList")
            currtentListLabel.text = currentShoppingList.uppercased()
            
        }
        sortSwitch = defaults.bool(forKey: "sortSwitch")
        newID = defaults.integer(forKey: "newID")
        budgetLimit = defaults.integer(forKey: "budgetLimit")
        currentShoppingList = defaults.string(forKey: "currentList") ?? "All Lists"
        updateBudgetColor()
        currtentListLabel.text = currentShoppingList.uppercased()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelectionDuringEditing = false
        loadItems()
        loadListArray()
        setSortArray()
        print(listArray)
        
        tableView.reloadData()
       
        print("this is the list \(currentShoppingList)")
        
//        for i in 0..<itemAray.count {
//            print("item \(sortableArray[i].item)")
//            }
//            for i in 0..<sortableArray.count {
//                print("sort \(sortableArray[i].item)")
//
//        }
        
//        setParentArray()
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if defaults.bool(forKey: "HasSeentutorial") == false {
            
            
            performSegue(withIdentifier: "goToTutorial", sender: self)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setSortArray()
        print("view is apearing")
        
        
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//        tableView.reloadData()
    }
    
    
    @IBAction func unwindToCalculator(_ sender: UIStoryboardSegue) {
        if sender.identifier == "goBackToHome" {
        
    loadItems()
        setSortArray()
        print("Updated tableview in unwind")
        print(currentShoppingList)
        tableView.reloadData()
            currtentListLabel.text = currentShoppingList.uppercased()

        }
        if sender.identifier == "fromInfoToHome" {
         print("got home from segue")
            sortSwitch = defaults.bool(forKey: "sortSwitch")
            print("\(sortSwitch)")
            setSortArray()
            tableView.reloadData()
        }
    }

    
    @IBAction func showListSelectorView(_ sender: UIButton) {
        performSegue(withIdentifier: "goToListSelector", sender: self)
      
        // show
    }
    
    
    @IBAction func checkmarkPressed(_ sender: UIButton) {
        uncheckMark()
    }
    

    
    @IBAction func actionButtonColorChange(_ sender: UIButton) {
        sender.backgroundColor = UIColor.secondarySystemGroupedBackground
    }
    
    @IBAction func actionButtonTouchedUpOutside(_ sender: UIButton) {
        sender.backgroundColor = UIColor.systemGray3
    }
    
    
    @IBAction func buttonColorTap(_ sender: UIButton) {
        if sender.tag == 1 {
        sender.backgroundColor = UIColor.darkGray
        }
        else {
            sender.backgroundColor = UIColor.secondarySystemGroupedBackground
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
        playSound(sender: sender.tag)
        
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
    
    
    @IBAction func removeAllChecksPressed(_ sender: UIButton) {
        playSound(sender: 2)
        print("Check Changer Pressed")
        showCheckActionSheet()
       
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
        
        playSound(sender: sender.tag)
        sender.backgroundColor = UIColor.systemGray3
        if let number = Int(currentString) {
           
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
        playSound(sender: sender.tag)
        sender.backgroundColor = UIColor.systemGray3
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
        playSound(sender: sender.tag)
        sender.backgroundColor = UIColor.systemGray3
        currentInt = 0
        currentString = ""
        currentLabel.text = "$0.00"
    }
    
    
    @IBAction func clearAllPressed(_ sender: UIButton) {
        playSound(sender: sender.tag)
        sender.backgroundColor = UIColor.systemGray3
        let alert = UIAlertController(title: "Clear" , message: "Are you sure you want to clear all calculation?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Clear", style: .default) { (action) in
            self.totalInt = 0
            self.saveTotal(self.totalInt)
            self.totalLabel.text = "$0.00"
            self.updateBudgetColor()
        }
        
        alert.addAction((UIAlertAction(title: "Cancel", style: .cancel, handler: nil)))
        alert.addAction(action)
        present(alert, animated: true, completion:
                updateBudgetColor)
        
    }
    
    
    
    func formatter(int: Int) -> String {
        let string = String(format: "%.2f", Double(int) * 0.01)
        return String("$\(string)")
    }
    
    func playSound(sender: Int) {
        if audio == true {
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
    

    @IBAction func addListItem(_ sender: UIButton) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add To Shopping List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            
//            let newItem = Item(context: self.context)
//            newItem.item = textField.text ?? "NewItem"
//            newItem.check = false
//            newItem.dateCreated = Date()
//            newItem.expectedPrice = 0
//            newItem.parentListName = self.currentShoppingList
            
            
        
            let newItem = ShoppingItem(id: self.newID, item: textField.text ?? "New Item", check: false, catagory: self.currentShoppingList, date: Date())
            self.newID += 1
            self.defaults.setValue(self.newID, forKey: "newID")
            self.itemAray.append(newItem)
            
            self.saveItems()
            self.setSortArray()
           
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
    
//    @IBAction func shoppingListPressed(_ sender: UIButton) {
//        listAnimationOpen()
//
//
//
    
    
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let item = sortableArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = item.item
        cell.accessoryType = item.check ? .checkmark : .none
        
        return cell
        }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = sortableArray[indexPath.row].id
        for i in 0..<itemAray.count {
            if itemAray[i].id == id {
                itemAray[i].check = !itemAray[i].check
            }
        }
//        sortableArray[indexPath.row].check = !sortableArray [indexPath.row].check
        tableView.deselectRow(at: indexPath, animated: true)
        saveItems()
        setSortArray()
        tableView.reloadData()
      
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            context.delete(itemAray[indexPath.row])
            let id = sortableArray[indexPath.row].id
           var tempArray = [ShoppingItem]()
            for i in 0..<itemAray.count {
                if itemAray[i].id != id {
                    tempArray.append(itemAray[i])
                }
            }
            itemAray = tempArray
            
            
            saveItems()
            setSortArray()
            print(currentShoppingList)
            tableView.reloadData()
          
            
        }
    }
    
    
}
    

    //MARK: - TableView

extension ViewController: UITableViewDelegate {

  
    
        

        
        

    
    
    
    
    func updateBudgetColor() {
        if budgetLimit == 0 {
            totalLabel.backgroundColor = UIColor(named: "GreenColorSet")
        }
        else if totalInt >= budgetLimit {
            totalLabel.backgroundColor = UIColor(named: "RedColorSet")
        }
        else if Double(totalInt) >= Double(budgetLimit) * 0.8 {
            totalLabel.backgroundColor = UIColor(named: "YellowColorSet")
            }
        else {
            totalLabel.backgroundColor = UIColor(named: "GreenColorSet")
            }
            
        }
    
    
    
    
    
    func listAnimationOpen() {
        UIView.animate(withDuration: 0.13, delay: 0.0, options: .curveEaseInOut,  animations: {
            self.lowerView.alpha = 0
            self.view.layoutIfNeeded()
            
            })
        self.removeAllChecksOutlet.isHidden = false

        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseInOut) {
            
            self.removeAllChecksOutlet.alpha = 1
            self.currentLabel.alpha = 0
            self.topViewConstraint.constant = 7
            self.view.layoutIfNeeded()
        } completion: { (true) in
            self.lowerView.isHidden = true
        }

        
        
        
//

    }
    
    func listAnimationClosed() {
        lowerView.isHidden = false
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.topViewConstraint.constant = 225
            self.currentLabel.alpha = 1
            self.view.layoutIfNeeded()
            self.removeAllChecksOutlet.alpha = 0
        })
        UIView.animate(withDuration: 0.20, delay: 0.15, options: .curveEaseInOut,  animations: {
            self.lowerView.alpha = 1
            self.view.layoutIfNeeded()
            
        })
        removeAllChecksOutlet.isHidden = true
    }
    
    func uncheckMark() {
        let alert = UIAlertController(title: "Remove" , message: "Are you sure you want to remove all Checkmarks", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Clear", style: .default) { (action) in
           
        
        
        
            for item in 0..<self.itemAray.count {
                self.itemAray[item].check = false
                self.saveItems()
        
        }
           
        }
        alert.addAction((UIAlertAction(title: "Cancel", style: .cancel, handler: nil)))
        alert.addAction(action)
        present(alert, animated: true, completion:
                nil)
    }
    
    func saveListArray() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(listArray)
            try data.write(to: listDataPath!)
        } catch {
            print("there was an error encoding the List Array \(error)")
        }
    }
    
    func loadListArray() {
        if let data = try? Data(contentsOf: listDataPath!) {
            let decoder = PropertyListDecoder()
            do {
                listArray = try decoder.decode([String].self, from: data)
            } catch {
                print("There was an error loading the data\(error)")
            }
        }
    }
        
    func setSortArray() {
        if sortSwitch == false {
        print("sort to bottom is off")
        if currentShoppingList == "All Lists" {
            print("all lists included")
            sortableArray = itemAray
            print(sortableArray.count)
            tableView.reloadData()
            print("item array count: \(itemAray.count)")
        } else {
            sortableArray.removeAll()
            for i in 0..<itemAray.count {
                if itemAray[i].catagory == currentShoppingList {
                    sortableArray.append(itemAray[i])
                    
                }
                print(sortableArray.count)
//                tableView.reloadData()
                
            }
        }
    }
        else {
            if currentShoppingList == "All Lists" {
                var tempArray = [ShoppingItem]()
                print("all lists included. sort set on")
                
//                sortableArray = itemAray
                for i in 0..<itemAray.count {
                    if itemAray[i].check == false {
                        tempArray.append(itemAray[i])
                    }
                    
                }
                for i in 0..<itemAray.count {
                    if itemAray[i].check == true {
                        tempArray.append(itemAray[i])
                    }
                }
                sortableArray = tempArray
                print("sorted \(sortableArray.count) items by check")
                tableView.reloadData()
                print("item array count: \(itemAray.count)")
            }
            else {
                sortableArray.removeAll()
                for i in 0..<itemAray.count {
                    if itemAray[i].catagory == currentShoppingList && itemAray[i].check == false {
                        sortableArray.append(itemAray[i])
                        
                    }
                }
                    for i in 0..<itemAray.count {
                        if itemAray[i].catagory == currentShoppingList && itemAray[i].check == true {
                            sortableArray.append(itemAray[i])
                        }
                    }
                    print(sortableArray.count)
    //                tableView.reloadData()
                    
                
            }
        }
        
    }
    
    func saveItems() {
        
        
        let encoder = PropertyListEncoder()
        do {
            let data =  try encoder.encode(itemAray)
            try data.write(to: dataPath!)
        } catch {
            print("error encoding ItemArray, \(error)")
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

extension ViewController: infoPageDelegate, listSelectordelegate {
   
    
    func returnAllLists(lists: [String]) {
//     loadListArray()
//        setSortArray()
         
    }
    
    func deleteList(list: String) {
      
        
    }
    
    func sortSwitch(onOff: Bool) {
        sortSwitch = onOff
        defaults.setValue(onOff, forKey: "sortSwitch")
        print("set switch from delegate")
    }
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
            vc.sortHolder = sortSwitch
            vc.delegate = self
        }
        else if segue.identifier == "goToListSelector" {
           
            let vc = segue.destination as! ListSelectorView
            vc.currentSelection = currentShoppingList
            vc.listArray = listArray
            
            }
           
            
        }
        
    
    
    func setParentArray() {
//        for i in 0..<itemAray.count {
//            if listArray.contains(itemAray[i].parentListName!) {
//                return
//            } else {
//                listArray.append(itemAray[i].parentListName!)
//            }
//        }
    }
    
    
    func showCheckActionSheet() {
        if currentShoppingList == "All Lists" {
            let alert = UIAlertController(title: "Clear All Check Marks From All Lists", message: "Are you sure you want to remove the check marks from ALL lists?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { (UIAlertAction) in
                for i in 0..<self.itemAray.count {
                    self.itemAray[i].check = false
                }
                self.saveItems()
                self.setSortArray()
                self.tableView.reloadData()
                
            })
            )
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
        let alert = UIAlertController(title: "Clear Check Marks", message: "Would you want to remove the check marks from all lists or just the current list?", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Remove From All", style: .destructive, handler: { (UIAlertAction) in
                for i in 0..<self.itemAray.count {
                    self.itemAray[i].check = false
                }
                self.saveItems()
                self.setSortArray()
                self.tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Current List Only", style: .default, handler: { (UIAlertAction) in
                for i in 0..<self.itemAray.count {
                    if self.itemAray[i].catagory == self.currentShoppingList {
                        self.itemAray[i].check = false
                    }
                    self.saveItems()
                    self.setSortArray()
                    self.tableView.reloadData()
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
}






extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
    
    
}

class Core {
    static let shared = Core()
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "HasSeentutorial")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.setValue(true, forKey: "HasSeentutorial")
    }
}


//extension ViewController {
//    func createListSelectorView() {
//        let window = UIApplication.shared.keyWindow
//        listSelectorView.backgroundColor = UIColor(named: "greenColorSet")
//        listSelectorView.frame.width = self.view.frame.width
//        listSelectorView.frame.height = 225
//        self.view.addSubview(listSelectorView)
//    }
//}
