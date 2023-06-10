//
//  LogInViewController.swift
//  AboutMeApp
//
//  Created by Денис Гиндулин on 08.06.2023.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    @IBOutlet private var forgotNameButton: UIButton!
    @IBOutlet private var forgotPasswordButton: UIButton!
    @IBOutlet private var logInButton: UIButton!
    
    //MARK: - Private Properties
    private let userName = "User"
    private let userPassword = "123"
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        userNameTextField.textContentType = .oneTimeCode
        passwordTextField.textContentType = .oneTimeCode
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IBActions
    @IBAction private func logInButtonWasPressedWithFailData() {
        if userNameTextField.text != userName || passwordTextField.text != userPassword {
            showInvalidLogInAlert()
        }
    }
    
    @IBAction private func forgotButtonWasPressed(_ sender: UIButton) {
        switch sender {
        case forgotNameButton:
            showForgotAlert(withMessage: "Your name is \(userName) 😉")
        case forgotPasswordButton:
            showForgotAlert(withMessage: "Your password is \(userPassword) 😉")
        default:
            break
        }
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
}

//MARK: - UIAlertControllers
private extension LoginViewController {
    
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
        
