//
//  ParentView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 6/9/21.
//

import SwiftUI

struct ParentView: View {
    
    @ObservedObject var list = MasterData()
    @State private var showingKEyboard = true
    @State private var output = ""
    @State private var compressedKeyBoard = false
    @State private var preferedLeftSpace = true
    var budget = false
    var isipad: Bool {
        
        
        
        if UIDevice.current.localizedModel == "iPad" {
            return true
        } else {
            return false
        }
    }
    func addButtonPressed() {
        
        
    }
    
    
    
    
    var body: some View {
        VStack(spacing: 5) {
            HeaderView(total: "$42.00", listName: "groceries")

            
            GeometryReader { geo in
                listSubView(rows: Int(geo.size.width) / 260, data: list, list: list)
                    .padding(.horizontal, 5)
            }

            
            HStack(spacing: 0) {
                if isipad { RoundedRectangle(cornerRadius: 25)
                .frame(maxHeight: 240)
                    .padding(.horizontal)
                    .layoutPriority(0)
                }
                HStack {
                VStack(spacing: 0) {
                    HStack {
                        Button(action: {
                            // add to list
                        }) {
                            Image(systemName: isipad ? "square.and.arrow.up" : "plus.app")
                        }
                        .disabled(isipad ? true : false)
                        
                        
                        .padding(.horizontal, 10)
                        .font(.system(size: 35))
                        .foregroundColor(Color(.secondarySystemGroupedBackground))
                        
                        Spacer()
                        Text(list.calculatorFormatter(string: list.currentString))
                            .font(.system(size: 22))
                            .frame(maxHeight: 35)
                            .padding(.horizontal)
                        
                        Spacer()
                        Button(action: {
                            // add to list
                        }) {
                            Image(systemName: "list.bullet.below.rectangle")
                        }
//                        .disabled(isipad ? true : false)
                    
                       
                        .padding(.horizontal, 10)
                 
                        .font(.system(size: 35))
                        .foregroundColor(Color(.secondarySystemGroupedBackground))

                    }
                    KeyBoard(data: list, compressedKeyboard: true, preferedLeftSpace: true, isBudgetKeyBoard: false)
                   
                    } // VStack
    //                Spacer()
                } // HStack
                .frame(maxWidth: isipad ? 300 : 400)
//                .layoutPriority(10)
            }
        }
        .background(Color("GreenColorSet").edgesIgnoringSafeArea(.all))
        .onAppear {
        
            self.list.loadUp()
            print("\(list.groups.count)")
        }
         
    }
    
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView(list: MasterData())
            .preferredColorScheme(.light)
            .previewDevice("ipod touch (seventh generation)")
        
            
    }
}



class MasterData: ObservableObject {
    @Published var items = [ShoppingItem]()
    @Published var selectedLists = [String]()
    @Published var groups = [listGroup]()
//    @Published var lists = [ListModel]()
//    @Published var currentLists = [ListModel]()
    @Published var curencyCymbol = "$"
//    @Published var newItems = [group1]()
    @Published var allListst = [String]()
    @Published var currentString = String()
    @Published var currentInt = Int()
    
    
    @Published var budgetLimit = Int()
    @Published var currentBudgetString = String()
    @Published var currentBudgetInt = Int()
   
    var newID = UserDefaults.standard.integer(forKey: "newID")
    
    init() {
        loadUp()
        translate()
    }
    
    func loadUp() {
        
        
        let dataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("GroceryListArray")
        let listDataPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ShoppingListArray")
        // Load Items
        if let data = try? Data(contentsOf: dataPath!) {
            let decoder = PropertyListDecoder()
            do {
            items = try decoder.decode([ShoppingItem].self, from: data)
//                print(items)
            
            } catch {
                print("There was an error loading the data\(error)")
            }
        } // Item Data
        budgetLimit = UserDefaults.standard.integer(forKey: "budgetLimit")
        print(budgetLimit)
        
    
            if let data = try? Data(contentsOf: listDataPath!) {
                let decoder = PropertyListDecoder()
                do {
                    allListst = try decoder.decode([String].self, from: data)
                } catch {
                    print("There was an error loading the data\(error)")
                }
            }
        
    }
    
    
    func translate() {
        var id = UserDefaults.standard.integer(forKey: "newID")
        var master = [listGroup]()
        
        for list in 0..<allListst.count {
            let group = listGroup(id: id, name: allListst[list], items: [ShoppingItem]())
            master.append(group)
            id += 1
            UserDefaults.standard.set(id, forKey: "newID")
//        print("master: \(master)")
        }
        for list in 0..<allListst.count {
            for item in 0..<items.count {
                if items[item].catagory == allListst[list] {
                    master[list].items.append(items[item])
                    }
                }
            }
        print("master: \(master)")
        groups = master
    }
    
    
    
    
    
    func calculatorFormatter(string: String) -> String {
        if string == "" {
            return "\(curencyCymbol)0.00"
        } else {
            if let number = Int(string) {
               let num = Double(number) * 0.01
                let formNum = String(format: "%.2f", num)
                return String("\(curencyCymbol)\(formNum)")
            }
        }
        return ""
    }

    func transform() {
        for i in 0..<items.count {
            
        }
    }
        
    
    func numberformatter(int: Int) -> String {
        return String(format: "%.2f", Double(int) * 0.01)
    }
    func setBudget(int: Int) {
        budgetLimit = int
    }
    func plusPressed() {
        
    }
    func minusPressed() {
        
    }
   
    func returnPressed() {
        
    }
    func budgetReturnPressed() {
        
    }
    func budgetMinusPressed() {
        
    }
    func budgetPlusPressed() {
        
    }
}

  

struct listGroup: Identifiable, Codable {
    var id: Int
    var name: String
    var items: [ShoppingItem]
}
     
struct newItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var exPrice: Int
    var parentList: String
    
    
}
             
struct ButtonStrip: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 16) {
         
        }// Overlay
        .padding(.trailing, 10)
        .padding(.vertical, 1)
    }
}
