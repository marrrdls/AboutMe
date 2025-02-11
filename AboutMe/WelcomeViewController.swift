//
//  WelcomeViewController.swift
//  AboutMe
//
//  Created by Margarita on 9.2.25..
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    
    @IBOutlet private var welcomeLabel: UILabel!
    
    var userName: String!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }
    
    @IBAction private func logOutAction() {
        dismiss(animated: true)
        
    }
    
}
