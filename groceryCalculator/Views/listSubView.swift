//
//  listSubView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 6/16/21.
//

import SwiftUI

struct listSubView: View {
    var rows: Int
    @ObservedObject var data: MasterData
    
    
    
    
    var columns: Int {
        if UIDevice.current.localizedModel == "iPhone" {
            return 1
        } else {
            return 0
        }
    }
    func column(group: Int) -> Int {
        var num = Double(data.groups[group].items.count + 1) / Double(rows)
        num = num.rounded(.up)
        return Int(num)
    }
    
    
    @ObservedObject var list: MasterData
    var body: some View {
        
       
   
        
        
            ScrollView {
                
                ForEach(0 ..< data.groups.count, id: \.self) { item in
                    VStack(spacing: 10) {
                
                            RoundedRectangle(cornerRadius: 10)
                                .shadow(color: .blue, radius: 15, x: 5, y: 10)
                                .frame(height: 30)
                                .foregroundColor(.blue)
                                
                                .overlay(HStack {
                                    Image(systemName: "checkmark")
                                        .padding(.horizontal, 5)
                                    Spacer()
                                    Text(data.groups[item].name)
                                    Spacer()
                                    Image(systemName: "plus")
                                        .padding(.horizontal, 5)
                                      
                                        .onTapGesture {
                                            data.groups.append(listGroup(id: data.newID, name: "new Group", items: [ShoppingItem]()))
                                                
                                        }
                                })
                                .padding(.top, 10)
                                .padding(.horizontal, 5)
                                .onTapGesture {
                                    
                                }
                        
                        HStack(spacing: 0) {
                                ForEach(0..<rows, id: \.self) { row in
                                    VStack {
                                        
                                        ForEach(0..<column(group: item), id: \.self) { col in
                                            
                                            
                                            if row + (col * rows) <= data.groups[item].items.count - 1 {
                                            thisView(data: data, num: row + (col * rows), group: item)
                                                    .padding(3)
                                            }
                                            else {
                                                PlusButton(data: data, group: item)
                                                    .padding(3)
                                            }

                                        }
                                    } // VStack rows
                                    .padding(.top)
                                }
                        } // HStack columns
                    } // VStack Group label and stack below
                } // ForEach
            } // ScrollView
            .onAppear {
                print("This one:")
                print(data.groups)
            }
            
        .background(Color.white)
        .cornerRadius(15)
        
        
    }
    
}

struct listSubView_Previews: PreviewProvider {
    static var previews: some View {
        listSubView(rows: 4, data: MasterData(), list: MasterData())
    }
}


struct thisView: View {
    @ObservedObject var data: MasterData
    var num: Int
    var group: Int
   

    var body: some View {
        
            HStack {
                Text("\(num + 1).")
                
                    .fontWeight(.thin)
                Text(data.groups[group].items[num].item)
                    
                    .font(.headline)
                    .fontWeight(.medium)

                Spacer()
                Text("\(data.groups[group].items[num].expectedPrice ?? 2)")
                    
                    
                Divider()
                Image(systemName: data.groups[group].items[num].check ? "checkmark.circle" : "circle")
                    .font(.title)
                    
            
                    .onTapGesture {
                        data.groups[group].items[num].check = !data.groups[group].items[num].check
                        }
                    
                    
            }
            .frame(maxHeight: 30)
            .padding()
            .background(Color(.systemGray))
            .cornerRadius(10)
            
           
        
    }
    
}


struct PlusButton: View {
    @ObservedObject var data: MasterData
    var group: Int
   
   

    var body: some View {
        
            HStack {
          
                Spacer()
          Image(systemName: "plus")
            
            .padding(.vertical, 7)
                    Spacer()
            

                    
                    
            }
            .frame(maxHeight: 40)
            .padding()
            .background(Color(.systemGray))
            .cornerRadius(10)
            .onTapGesture {
               
                data.groups[group].items.append(ShoppingItem(id: data.newID, item: "New Cookies", check: false, catagory: data.groups[group].name, expectedPrice: 400, date: Date()))
            }
           
        
    }
    
}
