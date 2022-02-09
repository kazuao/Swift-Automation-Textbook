//
//  XCUITestRegisterViewController.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/02/03.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapRegisterButton(_ sender: Any) {
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
    }
}
