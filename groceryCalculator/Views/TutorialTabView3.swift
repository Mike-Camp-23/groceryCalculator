//
//  TutorialTabView3.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/27/21.
//

import SwiftUI

struct TutorialTabView3: View {
    var body: some View {
        VStack {
            HStack {
                    Image(systemName: "list.bullet.below.rectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60, alignment: .topLeading)
                        .padding(10)
                        .foregroundColor(Color(.secondaryLabel))
                        .background(Color("GreenColorSet"))
                        .cornerRadius(10)
                        .padding()
               
                
                    
               
                    Text("When you just need to see more Shopping List, press this button and the calculator dissapears! Tap it again and it's back.")
                        .padding(10)
            
                
                 
                    
            } // HStack
            Divider()
            HStack{
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: .center)
                    .padding(10)
                    .foregroundColor(Color(.secondaryLabel))
                    .background(Color("GreenColorSet"))
                    .cornerRadius(10)
                    .padding()
                Text("When you're in a Shopping List, press this button to add an item to it. When you're in the List Manager, it will add a new List.")
                    .multilineTextAlignment(.leading)
                    .padding(10)
            } // HStack
            Spacer()
            HStack {
                HStack {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 40, alignment: .center)
                        .padding(10)
                        .foregroundColor(Color(.secondaryLabel))
                        .background(Color("GreenColorSet"))
                        .cornerRadius(10)
                        .padding(20)
                } // HStack
               
            }
        } // VStack
        .background(Color.red.edgesIgnoringSafeArea(.all))
    }
}

struct TutorialTabView3_Previews: PreviewProvider {
    static var previews: some View {
        TutorialTabView3()
    }
}
