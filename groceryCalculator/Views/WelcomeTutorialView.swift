//
//  WelcomeTutorialView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/27/21.
//

import SwiftUI

struct WelcomeTutorialView: View {
    
    //MARK: - properties
    
    var tabViews = [TutorialTabView1(), TutorialTabView2(), TutorialTabView3()] as [Any]
    
    //MARK: - body
    
    var body: some View {
        TabView {
           TutorialTabView1()
            .tabItem { Text("1") }
            
            TutorialTabView2()
                .tabItem { Text("2") }
                
            } // tabview
        
        }
    
    }


struct WelcomeTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeTutorialView()
            
    }
}
