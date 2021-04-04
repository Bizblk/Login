//
//  DetailViewController.swift
//  Login
//
//  Created by Виталий Оранский on 04.04.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    private func setupOutlets() {
        detailLabel.layer.masksToBounds = true
        detailLabel.layer.cornerRadius = 15
        detailLabel.text = text
    }
}
