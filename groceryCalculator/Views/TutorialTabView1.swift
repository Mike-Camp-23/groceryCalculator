//
//  TutorialTabView1.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/27/21.
//

import SwiftUI

struct TutorialTabView1: View {
    var body: some View {
        VStack {
           
                Image("IconSet")
                    .resizable()
                    .scaledToFit()
                    .background(Color("GreenColorSet")).cornerRadius(15)
                    .padding(35)
                Spacer()
            Text("Thank you for")
                .fontWeight(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            Text("purchasing the")
                .fontWeight(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            Text("Every Cart App!")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack() {
                Image(systemName: "arrow.forward")
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
    }
}

struct TutorialTabView1_Previews: PreviewProvider {
    static var previews: some View {
        TutorialTabView1()
            .preferredColorScheme(.dark)
    }
}
