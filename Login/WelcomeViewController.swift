//
//  WelcomeViewController.swift
//  Login
//
//  Created by Виталий Оранский on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var name = ""

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var logAutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()

    }
    
   
    
   
    
    private func setupOutlets() {
        userNameLabel.layer.masksToBounds = true
        userNameLabel.layer.cornerRadius = 10
        userNameLabel.text = "Hello \(name)"
        logAutButton.layer.cornerRadius = 15
    }
}
