//
//  WelcomeViewController.swift
//  Login
//
//  Created by Виталий Оранский on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    var admins = ["Admin", "Bigboss"]
    var name = ""
    var adminLogin = false

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var adminSettingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = name
        activateAdminSettings(inputName: name)
        setupLabel()
    }
    
   
    
    func activateAdminSettings(inputName: String) {
        for name in admins {
            if name == inputName {
                adminLogin = true
            }
        }
    }
    
    func setupLabel() {
        userNameLabel.layer.cornerRadius = 15
        adminSettingsLabel.layer.cornerRadius = 15
        if !adminLogin {
            adminSettingsLabel.isHidden = true
        }
    }
}
