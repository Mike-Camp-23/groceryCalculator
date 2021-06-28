//
//  CalculatorView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 5/13/21.
//

import SwiftUI

struct CalculatorView: View {
//    @ObservedObject var items = ListModel()
//    @EnvironmentObject var items2: ListModel
    
    
    @State var allItems: [ShoppingItem] = loadItems()
    @State var allLists: [String] = loadList()

    
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderView(total: "$40.23", listName: "All Lists")
//
            
//            ListSectionView(items: allItems, currentLabel: 459)
            }
        }
        .edgesIgnoringSafeArea(.all)
       
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! - 10)
        .background(Color("GreenColorSet"))
//        .background(Color("GreenColorSet"))
    }
    
    
}


func loadItems() -> [ShoppingItem] {
    var itemAray = [ShoppingItem]()
    if let data = try? Data(contentsOf: (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("GroceryListArray"))!) {
        let decoder = PropertyListDecoder()
        do {
        itemAray = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("There was an error loading the item data \(error)")
        }
    }
    print(itemAray.count)
    return itemAray
} // load Items
func loadList() -> [String] {
    var list = [String]()
    if let data = try? Data(contentsOf: (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ShoppingListArray"))!) {
        let decoder = PropertyListDecoder()
        do {
             list = try decoder.decode([String].self, from: data)
        } catch {
            print("There was an error loading the data in List\(error)")
        }
    }
    print(list)
    return list
}






struct CalculatorView_Previews: PreviewProvider {
//    static let list2 = ListModel()
    static var previews: some View {
        CalculatorView(allItems: [ShoppingItem(id: 1, item: "new", check: true, catagory: "groceries", expectedPrice: 3, date: Date())], allLists: ["this"])
            
    }
}



//[ShoppingItem(id: 1, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 2, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 3, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date()), ShoppingItem(id: 4, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 5, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 6, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date()), ShoppingItem(id: 7, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 8, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 9, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date()), ShoppingItem(id: 10, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 11, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 12, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date()), ShoppingItem(id: 13, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 14, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 15, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date())]
