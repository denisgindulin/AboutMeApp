//
//  LogInViewController.swift
//  AboutMeApp
//
//  Created by Денис Гиндулин on 08.06.2023.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var nameForgotButton: UIButton!
    @IBOutlet var passwordForgotButton: UIButton!
    
    
    let userName = "User"
    private let userPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    //MARK: - Private Methods
    @IBAction func logInButton() {
        //TODO: - здесь надо сделать переход на второй экран с приветствием по имени и с кнопкой Log Out
    }

    @IBAction func forgotButtonWasPressed(_ sender: UIButton) {
        switch sender {
        case nameForgotButton:
            showForgotAlert(withMessage: "Your name is \(userName) 😉")
        case passwordForgotButton:
            showForgotAlert(withMessage: "Your password is \(userPassword) 😉")
        default:
            break
        }
    }
}

//MARK: - UIAlertControllers
extension LogInViewController {
    
    private func showForgotAlert(withMessage message: String) {
        let forgotAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        forgotAlert.title = "Oops!"
        let okAction = UIAlertAction(
            title: "OK",
            style: .default
        )
        forgotAlert.addAction(okAction)
        
        present(forgotAlert, animated: true)
    }
}
        
