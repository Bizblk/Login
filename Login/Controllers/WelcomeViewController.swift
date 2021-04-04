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
    @IBOutlet weak var userImageView: UIImageView!
    
    //MARK: - Public Properties
    var user: User!
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    //MARK: - Private Methods
    private func setupOutlets() {
        userNameLabel.layer.masksToBounds = true
        userNameLabel.layer.cornerRadius = 10
        userNameLabel.text = """
            Hi, my name is \(user.person.name) \(user.person.lastName), there is some information about me here,
            but you can find more detailed information on the tabbar tabs
            """
        logAutButton.layer.cornerRadius = 15
        userImageView.image = UIImage(named: user.person.photo)
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
    }
}
