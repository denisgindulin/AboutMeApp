//
//  LogInViewController.swift
//  AboutMeApp
//
//  Created by Денис Гиндулин on 08.06.2023.
//

import UIKit

class LogInViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var nameForgotButton: UIButton!
    @IBOutlet var passwordForgotButton: UIButton!
    @IBOutlet var logInButton: UIButton!
    
    //MARK: - Private Properties
    private let userName = "User"
    private let userPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }

    //MARK: - IBActions
    @IBAction func logInButtonWasPressed() {
        if userNameTextField.text == userName && passwordTextField.text == userPassword {
            //TODO: - здесь надо сделать переход на второй экран с приветствием по имени и с кнопкой Log Out
        } else {
            showInvalidLogInAlert()
        }
        
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
private extension LogInViewController {
    
    func showForgotAlert(withMessage message: String) {
        let forgotAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        forgotAlert.title = "Oops!"
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        forgotAlert.addAction(okAction)
        
        present(forgotAlert, animated: true)
    }
    
    func showInvalidLogInAlert() {
        let invalidLogInAlert = UIAlertController(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            preferredStyle: .alert
        )
    
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in self.clearTextField()}
        invalidLogInAlert.addAction(okAction)
        
        present(invalidLogInAlert, animated: true)
    }
    
    func clearTextField() {
        passwordTextField.text = ""
    }
}
        
