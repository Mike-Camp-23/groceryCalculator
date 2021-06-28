//
//  ContentView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 5/19/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @State private var curency = "$"
    @State private var calcString = ""
    @State private var calcInt = 0
    @State private var budgetLimit = 0
    
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                HeaderView(total: "$42.00", listName: "All Lists")
//                ListSectionView(items: [ShoppingItem(id: 2, item: "Milk", check: false, catagory: "all", expectedPrice: 2, date: Date())], currentLabel: 3)
            }
            
            
           


        }
        
//        .background(Color("GreenColorSet")).edgesIgnoringSafeArea(.all)
//        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
//        
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
