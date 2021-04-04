//
//  AboutMeViewController.swift
//  Login
//
//  Created by Виталий Оранский on 04.04.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var familyButton: UIButton!
    @IBOutlet weak var hobbyButton: UIButton!
    @IBOutlet weak var workButton: UIButton!
    
    //MARK: - Public Properties
    var user: User!
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "family":
            guard let destination = segue.destination as? DetailViewController else { return }
            destination.text = user.person.family
        case "hobby":
            guard let destination = segue.destination as? DetailViewController else { return }
            destination.text = user.person.hobbies
        case "work":
            guard let destination = segue.destination as? DetailViewController else { return }
            destination.text = user.person.work
        default:
            return
        }
        
        
        
    }
    
    //MARK: - IB Action
    @IBAction func familyAction(_ sender: Any) {
    }
    @IBAction func hobbyAction(_ sender: Any) {
    }
    @IBAction func workAction(_ sender: Any) {
    }
    
    //MARK: - Private Methods
    private func setupOutlets() {
        familyButton.layer.cornerRadius = 15
        familyButton.imageView?.layer.cornerRadius = 15
        hobbyButton.layer.cornerRadius = 15
        hobbyButton.imageView?.layer.cornerRadius = 15
        workButton.layer.cornerRadius = 15
        workButton.imageView?.layer.cornerRadius = 15
    }
    
}
