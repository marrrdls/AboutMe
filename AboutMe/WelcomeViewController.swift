//
//  WelcomeViewController.swift
//  AboutMe
//
//  Created by Margarita on 9.2.25..
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    var welcomeText: String!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let welcomeText = welcomeText {
            welcomeLabel.text = "Welcome, \(welcomeText)"
        }
    }
    
    @IBAction private func logOutAction() {
        dismiss(animated: true)
        
    }
    
}
