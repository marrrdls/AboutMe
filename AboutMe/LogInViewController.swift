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
    
    @IBOutlet private var logInButton: UIButton!
    
    @IBOutlet private var forgotUserNameButton: UIButton!
    @IBOutlet private var forgotPasswordButton: UIButton!
    
    
    @IBAction func logInButtonAction(_ sender: UIButton) {
        let correctUserName = "M"
        let correctPassword = "1"
        
        let enteredUserName = userNameTextField.text ?? ""
        let enteredPassword = passwordTextField.text ?? ""
        
        if enteredUserName == correctUserName && enteredPassword == correctPassword {
            print ("Logged in")
        } else {
            passwordTextField.text = ""
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
        }
        
    }
    
    @IBAction func forgotUserNameAction(_ sender: Any) {
        showAlert(withTitle: "Ooops!", andMessage: "Your name is M")
    }
    
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        showAlert(withTitle: "Ooopsie!", andMessage: "Your password is 1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.autocorrectionType = .no
        userNameTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
               
        passwordTextField.isSecureTextEntry = true
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.welcomeText = userNameTextField.text
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }

}

extension LogInViewController {
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
