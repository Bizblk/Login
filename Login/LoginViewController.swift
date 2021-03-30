//
//  ViewController.swift
//  Login
//
//  Created by Виталий Оранский on 29.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    var logPas:[String: String] = ["Ivan": "123", "Admin": "666", "Bigboos": "999"]
    var loginToggle = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if userNameField.text!.isEmpty && passwordField.text!.isEmpty {
            
        } else {
            guard segue.identifier == "welcomeSegue" else { return }
            guard let destination = segue.destination as? WelcomeViewController else { return }
            destination.name = userNameField.text ?? ""
        }
        
        
    }

    @IBAction func logInAction(_ sender: Any) {
        ferefy(nameInput: userNameField.text ?? "", passInput: passwordField.text ?? "")
        if loginToggle {
            
        } else {
            showAlert(title: "МОЯ ТВОЯ", massage: "НЕ ПОНИМАТЬ")
        }
    
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        showAlert(title: "Your password send you mail", massage: "123")
    }
    @IBAction func forgotUserNameAction(_ sender: Any) {
        showAlert(title: "Your User Name send you mail", massage: "Ivan")
    }
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
        loginToggle = false
    }
    
    private func showAlert(title: String, massage: String) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Done", style: .default)
               
               alert.addAction(alertAction)
               present(alert, animated: true)
    }
    
    func ferefy(nameInput: String, passInput: String) {
        if !logPas.isEmpty {
            for name in logPas {
                if name.key == nameInput && name.value == passInput {
                    loginToggle = true
                }
            }
        }
    }
    
   
    
}

