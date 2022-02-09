//
//  XCUITestViewController.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/02/03.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.accessibilityIdentifier = "login_email_textfield"
        passwordTextField.accessibilityIdentifier = "login_password_textfield"
        loginButton.accessibilityIdentifier = "login_login_button"
        registerButton.accessibilityIdentifier = "login_register_button"

        calc()
    }

    func calc() {
        var x = "hello"

        for _ in 1...5 {
            x += "hoge"
        }
    }

    @IBAction func tapLoginButton(_ sender: Any) {
    }
    @IBAction func tapRegisterButton(_ sender: Any) {
    }
}

