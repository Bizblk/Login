//
//  MyGoalsViewController.swift
//  Login
//
//  Created by Виталий Оранский on 04.04.2021.
//

import UIKit

class MyGoalsViewController: UIViewController {
    
    @IBOutlet weak var goalsLabel: UILabel!
    var goalsText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    private func setupOutlets() {
        goalsLabel.layer.masksToBounds = true
        goalsLabel.layer.cornerRadius = 15
        goalsLabel.text = goalsText
    }
}
