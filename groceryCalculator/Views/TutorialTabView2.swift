//
//  TutorialTabView2.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/27/21.
//

import SwiftUI

struct TutorialTabView2: View {
    var body: some View {
        VStack {
            HStack {
                    Image(systemName: "gearshape")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60, alignment: .topLeading)
                        .padding(10)
                        .foregroundColor(Color(.secondaryLabel))
                        .background(Color("GreenColorSet"))
                        .cornerRadius(10)
                        .padding()
               
                
                    
               
                    Text("Be sure to check out the settings to set a budet limit! The app will inform you when your reach 80% (Yellow Total) and 100%  (Red Total).")
                        .padding(10)
            
                
                 
                    
            } // HStack
            Divider()
            HStack{
                Image(systemName: "list.number")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: .center)
                    .padding(10)
                    .foregroundColor(Color(.secondaryLabel))
                    .background(Color("GreenColorSet"))
                    .cornerRadius(10)
                    .padding()
                Text("This button will allow you to add custom lists and select one or all as active. Create as many as you want to aid in your shopping endevours! If that's not your thing, just ignore it and keep on shopping with the default list!")
                    .multilineTextAlignment(.leading)
                    .padding(10)
            } // HStack
            Spacer()
            HStack {
                HStack {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40, alignment: .center)
                    Image(systemName: "arrow.forward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40, alignment: .center)
                } // HStack
                .padding(10)
                .foregroundColor(Color(.secondaryLabel))
                .background(Color("GreenColorSet"))
                .cornerRadius(10)
                .padding(20)
            }
        } // VStack
    }
}

struct TutorialTabView2_Previews: PreviewProvider {
    static var previews: some View {
        TutorialTabView2()
            .preferredColorScheme(.dark)
    }
}
