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
    private let user = User.getUser()
    private var loginToggle = false
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        passwordField.delegate = self
        logInButton.layer.cornerRadius = 15
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                aboutUserVC.user = user
            } else if let goalsVC = viewController as? MyGoalsViewController {
                goalsVC.goalsText = user.person.goals
            }
        }
    }
    
    
    //MARK: - IB Action
    @IBAction func logInAction(_ sender: Any) {
        ferefy(nameInput: userNameField.text ?? "", passInput: passwordField.text ?? "")
        if !loginToggle {
            showAlert(title: "Incorrect password or login", massage: "Use the tips")
            passwordField.text = ""
        }
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        showAlert(title: "Test password", massage: "123")
    }
    
    @IBAction func forgotUserNameAction(_ sender: Any) {
        showAlert(title: "Test login", massage: "biz")
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
                passwordField.text = ""
            }
            performSegue(withIdentifier: "welcomeSegue", sender: nil)
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
        if nameInput == user.login && passInput == user.password {
            loginToggle = true
        }
    }
}

