//
//  WelcomeViewController.swift
//  Login
//
//  Created by Виталий Оранский on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var logAutButton: UIButton!
    
    //MARK: - Public Properties
    var name = ""
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    //MARK: - Private Methods
    private func setupOutlets() {
        userNameLabel.layer.masksToBounds = true
        userNameLabel.layer.cornerRadius = 10
        userNameLabel.text = "Hello \(name)"
        logAutButton.layer.cornerRadius = 15
    }
}
