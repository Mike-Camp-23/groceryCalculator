//
//  LIstSectionView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 5/13/21.
//

//import SwiftUI
//
//struct ListSectionView: View {
//    
//    @State var items: [ShoppingItem]
//    @State var currentLabel: Int
//    @State private var showKeyboard = true
//    func formatt(_ number: Int) -> String {
//        return "$\(Double(number) * 0.01)"
//        
//        
//    }
//    var body: some View {
//       
//        ZStack {
//            VStack {
//                List {
//                    ForEach(items, id: \.self.id) { item in
//                        HStack {
//                            Text(item.item)
//                            Spacer()
//                            Text(formatt(item.expectedPrice ?? 0))
//                            Image(systemName: item.check ? "checkmark" : "circle")
//                                
//                            }
//                        }
//                    }
//                
//                
//                .cornerRadius(15)
//                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: 0,y: 8)
//                .padding(.horizontal, 5)
//
//                HStack {
//                    // Left Button
//                    Button(action: {}, label: {
//                        Image(systemName: "plus")
//                            .font(.largeTitle)
//                            .foregroundColor(Color(UIColor.secondaryLabel))
////                            .shadow(radius: 2)
//                    })
//                    .padding(.leading,4)
//                    Spacer()
//                    // Current Label
//                    Text(formatt(currentLabel))
//                        .font(.title)
//                        .fontWeight(.light)
//                    Spacer()
//                    // Right Button
//                    Button(action: {
//                        showKeyboard.toggle()
//                    }, label: {
//                        Image(systemName: "list.bullet.below.rectangle")
//                            .font(.largeTitle)
//                            .foregroundColor(Color(UIColor.secondaryLabel))
////                            .shadow(radius: 2)
//                    })
//                    .padding(.trailing,4)
//                }
//            }
////            .background(Color("GreenColorSet"))
//            .padding(.bottom, showKeyboard ? 225 : 5)
//            
//            showKeyboard ? ButtonView() : nil
//        }
//        
//        .background(Color("GreenColorSet"))
//        .edgesIgnoringSafeArea(.all)
//    }
//    
//}
//
//struct ListSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        ListSectionView(items: [ShoppingItem(id: 1, item: "Milk", check: true, catagory: "Groceries", expectedPrice: 300, date: Date()), ShoppingItem(id: 2, item: "Ice Cream", check: false, catagory: "Groceries", expectedPrice: 599, date: Date()), ShoppingItem(id: 3, item: "Cheese", check: false, catagory: "Groceries", expectedPrice: 299, date: Date())], currentLabel: 124)
//            .previewDevice("iPod touch (7th generation)")
//            .background(Color("GreenColorSet"))
//    }
//    
//}







