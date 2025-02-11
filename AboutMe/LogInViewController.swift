//
//  LogInViewController.swift
//  AboutMe
//
//  Created by Margarita on 9.2.25..
//

import UIKit

final class LogInViewController: UIViewController {
    
    
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    private let user = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.autocorrectionType = .no
        userNameTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        
        passwordTextField.isSecureTextEntry = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password") 
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userName = user
    }
    
    
    @IBAction private func forgotRegisterData(_ sender: UIButton) {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is \(sender.tag == 0 ? user : password)"
        )
    }
    
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}

 
    
