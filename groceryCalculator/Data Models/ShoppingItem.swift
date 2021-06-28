//
//  ShoppingItem.swift
//  groceryCalculator
//
//  Created by Michael Camp on 3/31/21.
//

import Foundation


struct ShoppingItem : Codable{
    var id: Int
    var item: String
    var check: Bool
    var catagory: String
    var expectedPrice: Int?
    var date: Date
    
    
}

struct ListModel: Codable {
    var id: Int
    var name: String
    
    
}
