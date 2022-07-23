//
//  ViewController.swift
//  TabasaranGram
//
//  Created by mac on 23.07.2022.
//

import UIKit

class AuthorizationVC: UIViewController {

    @IBOutlet weak var secureTypeBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // Background Text field
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    
    var isSecureType = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
    }

    func setupUI() {
        loginView.layer.cornerRadius = 8
        passwordView.layer.cornerRadius = 8
        
        loginView.layer.borderWidth = 0.5
        passwordView.layer.borderWidth = 0.5
        
        loginView.layer.borderColor = UIColor.gray.cgColor
        passwordView.layer.borderColor = UIColor.gray.cgColor
        
        
        loginBtn.layer.cornerRadius = 12
        loginBtn.isEnabled = false
        loginBtn.alpha = 0.5
    }

    func setup() {
        loginTF.addTarget(self, action: #selector(checkLoginBtn), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(checkLoginBtn), for: .editingChanged)
    }
   
    @objc func checkLoginBtn() {
        guard let loginText = loginTF.text, let passwordText = passwordTF.text else { return }
        
        if loginText.isEmpty || passwordText.isEmpty {
            loginBtn.isEnabled = false
            loginBtn.alpha = 0.5
        } else {
            loginBtn.isEnabled = true
            loginBtn.alpha = 1
        }
    }
    
    func showAlert(with text: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func secureTypeBtnT(_ sender: Any) {
        isSecureType = !isSecureType
        passwordTF.isSecureTextEntry = isSecureType
        secureTypeBtn.isSelected = !isSecureType
    }
    
    @IBAction func forgotPasswordBtnT(_ sender: Any) {
        self.showAlert(with: "Section in development")
    }
    
    @IBAction func loginBtnT(_ sender: Any) {
        self.showAlert(with: "Pressed login button")
    }
}

