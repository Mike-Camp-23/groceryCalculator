//
//  List.swift
//  groceryCalculator
//
//  Created by Michael Camp on 6/9/21.
//

import SwiftUI

struct List: View {
    
    var list = [
        [ShoppingItem(id: 1, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 2, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 3, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date()), ShoppingItem(id: 4, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 5, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 6, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date()), ShoppingItem(id: 7, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 8, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 9, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date()), ShoppingItem(id: 10, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 11, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 12, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date()), ShoppingItem(id: 13, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 14, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 15, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date())]
    ]
    
    
    var body: some View {
        ForEach(0 ..< list.count) { item in
            
        }
        
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        List()
    }
}
