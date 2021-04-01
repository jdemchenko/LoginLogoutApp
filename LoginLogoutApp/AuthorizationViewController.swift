//
//  ViewController.swift
//  LoginLogoutApp
//
//  Created by Ivan Demchenko on 31.03.21.
//

import UIKit

class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IB Outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInStackView: UIStackView!
    
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var forgotUserNameBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    // MARK: - Private Properties
    private let userName = "lex.efimov"
    private let password = "password"
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        logInBtn.layer.cornerRadius = 5
        
        autoShrinkForButton(button: forgotUserNameBtn)
        autoShrinkForButton(button: forgotPasswordBtn)
        autoShrinkForButton(button: logInBtn)
    }
    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? InAppViewController else { return }
        destination.userName = userNameTF.text
    }
    
    // MARK: - IB Actions
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.source is InAppViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
    @IBAction func logInBtnPressed() {
        checkUsernameAndPassword()
    }
    @IBAction func forgotUserNamePresser() {
        showAlert(title: "Don't worry!", message: "Your username is \(userName)")
    }
    @IBAction func forgotPasswordPresser() {
        showAlert(title: "Don't worry!", message: "Your password is \(password)")
    }
    
    // MARK: - Public Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.logInStackView.frame = CGRect(x:self.logInStackView.frame.origin.x, y:self.logInStackView.frame.origin.y - 90, width:self.logInStackView.frame.size.width, height:self.logInStackView.frame.size.height)
        })
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.logInStackView.frame = CGRect(x:self.logInStackView.frame.origin.x, y:self.logInStackView.frame.origin.y + 90, width:self.logInStackView.frame.size.width, height:self.logInStackView.frame.size.height)
        })
    }
    
    func autoShrinkForButton(button: UIButton) {
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.minimumScaleFactor = 0.5
        button.clipsToBounds = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {//delegate method
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            passwordTF.resignFirstResponder()
            logInBtnPressed()
            performSegue(withIdentifier: "logInIdentifier", sender: .none)
        }
        return true
    }
    
    // MARK: - Private Methods
    private func checkUsernameAndPassword() {
        if userNameTF.text != userName {
            showAlert(title: "Error", message: "The username you entered doesn't appear to belong to an account.\n Please check your username and try again.")
        } else if passwordTF.text != password {
            showAlert(title: "Error", message: "The password you entered doesn't appear to belong to an account.\n Please check your password and try again.")
            passwordTF.text = ""
        }
    }
    
}


// MARK: - Table View Data Source
extension AuthorizationViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
