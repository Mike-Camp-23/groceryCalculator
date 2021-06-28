//
//  File.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/20/21.
//

import Foundation

//class LocalFileManager {
//    static let instance = LocalFileManager()
//
//
//    func saveItems(all: [Item2]) {
//
//        let data = all
//
//        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Master2.0")
//
//        let encoder = PropertyListEncoder()
//        do {
//            let dat = try encoder.encode(ListModel)
//        }
//    }
//
//    func loadListArray() {
//        var listArray = [String]()
//        let listDataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ShoppingListArray")
//        if let data = try? Data(contentsOf: listDataPath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                listArray = try decoder.decode([String].self, from: data)
//            } catch {
//                print("There was an error loading the data\(error)")
//            }
//    }
//        for i in 0..<listArray.count {
//            let newList =
//        }
//    }
//
//
//    func loadItems() -> [ListModel] {
//        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("MasterListArray")
//        if let data = try? Data(contentsOf: directory) {
//            let decoder = PropertyListDecoder()
//            do {
//                SelectedLists.
//            }
//        }
//    }
//}



//class ListModel: ObservableObject {
//    @Published var items: [Item2]
//    @Published var lists: [List2]
//    @Published var selectedLists: [List2]
//    @Published var hasLoadedFromOld = false
//
    
//    let manager = LocalFileManager.instance
    
    
//    init() {
//        getItemsFromFileManager()


//    }
   
//    func getItemsFromFileManager() {
        
//        
//    }
//    
//    
//}



class List2: Identifiable, Codable {
    var id = UUID()
    var name: String
    var totalExpectedPrice: Int?
    
}

class Item2: Identifiable, Codable {
    var id = UUID()
    var name: String
    var check: Bool
    var catagory: String
    var expectedPrice: Int?
    var date: Date
    
}

//class SelectedLists: Identifiable, Codable {
//    var lists: [List2]
//
//    let manager = LocalFileManager()
//    init() {
//        let currentlist = UserDefaults.standard.string(forKey: "currentList")
//
//
//    }
//
//
//
//}











