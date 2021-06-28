//
//  HeaderView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 5/13/21.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - Properties
   @State var total: String
   @State var listName: String
    
    var budgetCondition: Int = 0
    
    
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            HStack{
                
                // Left Button
                
                Button(action: {}, label: {
                    Image(systemName: "gear")
                        .font(.title)
                        .shadow(radius: 10)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .padding(.leading, 5)
                       
                })
                .padding(.bottom, 26)
                // Middle Label
                HStack {
                    Spacer()
                    VStack {
                        ZStack {
                            Capsule()
                                .frame(width: 180)
                                                            .foregroundColor(Color("RedColorSet"))
                                .shadow(radius: 10)
                                .padding(.leading)
                                .padding(.trailing)
                            Text(total)
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(width: 175)
                            
                        }
                        
                        Text(listName.uppercased())
                    }
                    Spacer()
                }
                Button(action: {}, label: {
                    Image(systemName: "list.number")
                        .font(.title)
                        .shadow(radius: 10)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .padding(.trailing, 5)
                        
                })
                .padding(.bottom, 26)
                
            }
        }
        .background(Color("GreenColorSet"))
//        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .frame(height: 70, alignment: .center)
//     .edgesIgnoringSafeArea(.all)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(total: "$700.50", listName: "All lists")
            .previewLayout(.sizeThatFits)
            .previewDevice("iPod touch (7th generation)")
            
    }
}
