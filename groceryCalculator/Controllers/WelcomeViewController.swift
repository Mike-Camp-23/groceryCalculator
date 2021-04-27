//
//  WelcomeViewController.swift
//  groceryCalculator
//
//  Created by Michael Camp on 4/26/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var holderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setValue(true, forKey: "HasSeentutorial")

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func getStartedButton(_ sender: UIButton) {
//       performSegue(withIdentifier: "goToTutorialView2", sender: self)
    
    
//            let vc = storyboard?.instantiateViewController(identifier: "welcome2") as! WelcomePage2ViewController
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


