//
//  ListSelectorView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/20/21.
//


protocol listSelectordelegate: class {
    func deleteList(list: String)
    func returnAllLists(lists: [String])
}

import UIKit

let keyStringForList = "currentList"
let keyStringforArray = "ShoppingListArray"
class ListSelectorView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let dataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("GroceryListArray")
    let defaults = UserDefaults.standard
    let listDataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(keyStringforArray)
 var currentSelection = String()
    var listArray = [String]()
    
    var delegate: listSelectordelegate!
    
    var itemAray = [ShoppingItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
      loadItems()
//        currentSelection = defaults.string(forKey: keyStringForList)!
        shoppingLIstTableView.delegate = self
        shoppingLIstTableView.dataSource = self
//        loadListArray()
        shoppingLIstTableView.reloadData()
        
    }
    
    
    
    @IBAction func addListPressed(_ sender: UIButton) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New List", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add List", style: .default) { (action) in
            if textField.text == "" || self.listArray.contains(textField.text!) {
                return
            } else {
            let item = textField.text
//            print("new list: \(item)")
//            print(self.currentSelection)
            self.listArray.append(item ?? "New List")
            self.saveListArray()
            self.currentSelection = item ?? "New List"
            self.defaults.setValue(item, forKey: "currentList")
//            self.delegate?.selectNewList()
            self.shoppingLIstTableView.reloadData()
               

            }
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField { (alertTextField) in
            alertTextField.autocapitalizationType = .words
            alertTextField.autocorrectionType = .default
            
            alertTextField.placeholder = "New List"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    @IBAction func dismissAreaTapped(_ sender: UIButton) {
//        saveListArray()
        self.performSegue(withIdentifier: "goBackToHome", sender: self)
        
//        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    
    @IBOutlet weak var shoppingLIstTableView: UITableView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
      }
      
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listItem = listArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "listListCell", for: indexPath)
        cell.textLabel?.text = listItem
        if listItem == currentSelection {
            cell.accessoryType = .checkmark
            return cell
        }
        else {
            cell.accessoryType = .none
            return cell
        }
        
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        currentSelection = listArray[indexPath.row]
        defaults.setValue(currentSelection, forKey: "currentList")
        print("currnet selectio: \(currentSelection)")
//        for i in 0..<listArray.count {
//            tableView.cellForRow(at: i) {
                
//            }
//        }
        shoppingLIstTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        delegate?.selectNewList()
        print("Delegate Fired")
        shoppingLIstTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if listArray[indexPath.row] != "All Lists" {
            return true
        } else {
            return false
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let alert = UIAlertController(title: "Delete" , message: "Are you sure you want to permanently delete this Shopping List and everything in it?", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Delete", style: .default) { (action) in
//                self.delegate?.deleteList(list: self.listArray[indexPath.row])
                self.deleteList(list: self.listArray[indexPath.row])
                self.saveItems()
                self.listArray.remove(at: indexPath.row)
                self.currentSelection = self.listArray.first!
                self.defaults.setValue(self.currentSelection, forKey: "currentList")
                self.saveListArray()
                self.shoppingLIstTableView.reloadData()
            
            }
            
            alert.addAction((UIAlertAction(title: "Cancel", style: .cancel, handler: nil)))
            alert.addAction(action)
            present(alert, animated: true, completion:
                        shoppingLIstTableView.reloadData)
            
        }
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
    
    func saveItems() {
        
        
        let encoder = PropertyListEncoder()
        do {
            let data =  try encoder.encode(itemAray)
            try data.write(to: dataPath!)
        } catch {
            print("error encoding ItemArray, \(error)")
        }
    }
    
    
    func deleteList(list: String) {
        var tempArray = [ShoppingItem]()
        for i in 0..<itemAray.count {
            if itemAray[i].catagory != list {
                tempArray.append(itemAray[i])
            }
        }
        itemAray = tempArray
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBackToHome" {
            let vc = segue.destination as! ViewController
            vc.currentShoppingList = currentSelection
            vc.listArray = listArray
        }
    }
}


