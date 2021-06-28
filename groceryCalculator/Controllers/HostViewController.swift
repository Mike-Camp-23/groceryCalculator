//
//  HostViewController.swift
//  groceryCalculator
//
//  Created by Michael Camp on 5/19/21.
//

import UIKit
import SwiftUI

class HostViewController: UIViewController {

    fileprivate let content = UIHostingController(rootView: ParentView())
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHC()
        setupConstraints()
//        content.view.backgroundColor = UIColor(named: "GreenColorSet")
        // Do any additional setup after loading the view.
    }
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
        content.view.widthAnchor.constraint(equalTo: view.widthAnchor),
        content.view.heightAnchor.constraint(equalTo: view.heightAnchor),
        content.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        content.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    fileprivate func setupHC() {
        addChild(content)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
