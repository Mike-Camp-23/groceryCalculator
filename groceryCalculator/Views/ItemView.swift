//
//  SwiftUIView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 6/9/21.
//

import SwiftUI

struct ItemView: View {
    @ObservedObject var data: MasterData
//   @Binding var item: ShoppingItem
    var item: ShoppingItem
    var body: some View {
        Button(action: {
            
        }) {
        HStack {
            Text(item.item)
                .font(.title)
                .padding()
            Spacer()
//            Text("$\(item.expectedPrice!)" ?? "$0")
            withAnimation() {
            Image(systemName: item.check ? "checkmark" : "circle")
                .font(.title)
                .padding()
            }
        }
        .frame(height: 65)
        
            }
        .onTapGesture {
            for i in 0 ..< data.items.count {
                if item.id == data.items[i].id {
                    data.items.remove(at: i)
                }
               
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    @State static var item = ShoppingItem(id: 1, item: "Milk", check: true, catagory: "groceries", expectedPrice: 467, date: Date())
    static var previews: some View {
        ItemView(data: MasterData(), item: item)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
    
}
