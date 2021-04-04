//
//  AboutMeViewController.swift
//  Login
//
//  Created by Виталий Оранский on 04.04.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    @IBOutlet weak var familyButton: UIButton!
    @IBOutlet weak var hobbyButton: UIButton!
    @IBOutlet weak var workButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
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
    
    
    @IBAction func familyAction(_ sender: Any) {
    }
    @IBAction func hobbyAction(_ sender: Any) {
    }
    @IBAction func workAction(_ sender: Any) {
    }
    
    
    private func setupOutlets() {
        familyButton.layer.cornerRadius = 15
        hobbyButton.layer.cornerRadius = 15
        workButton.layer.cornerRadius = 15
    }

}
