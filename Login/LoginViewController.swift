//
//  ViewController.swift
//  Login
//
//  Created by Виталий Оранский on 29.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IB Outlets
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    //MARK: - Private Properties
    private var logPas: [String: String] = ["Ivan": "123", "Admin": "666"]
    private var loginToggle = false
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        passwordField.delegate = self
        logInButton.layer.cornerRadius = 15
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !userNameField.text!.isEmpty && !passwordField.text!.isEmpty {
            guard segue.identifier == "welcomeSegue" else { return }
            guard let destination = segue.destination as? WelcomeViewController else { return }
            destination.name = userNameField.text ?? ""
        }
    }
    
    //MARK: - IB Action
    @IBAction func logInAction(_ sender: Any) {
        ferefy(nameInput: userNameField.text ?? "", passInput: passwordField.text ?? "")
        if !loginToggle {
            showAlert(title: "Incorrect password or login", massage: "Use the tips")
        }
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        showAlert(title: "Test password", massage: "123")
    }
    
    @IBAction func forgotUserNameAction(_ sender: Any) {
        showAlert(title: "Test name", massage: "Ivan")
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
        loginToggle = false
    }
    
    //MARK: - Public Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameField {
            passwordField.becomeFirstResponder()
        } else {
            ferefy(nameInput: userNameField.text ?? "", passInput: passwordField.text ?? "")
            if !loginToggle {
                showAlert(title: "Incorrect password or login", massage: "Use the tips")
            }
            performSegue(withIdentifier: "welcomeSegue", sender: Any?.self)
        }
        return true
    }
    
    //MARK: - Private Methods
    
    private func showAlert(title: String, massage: String) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Done", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    private func ferefy(nameInput: String, passInput: String) {
        if !logPas.isEmpty {
            for name in logPas {
                if name.key == nameInput && name.value == passInput {
                    loginToggle = true
                }
            }
        }
    }
}

