//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Денис Гиндулин on 09.06.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet private var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }
}
