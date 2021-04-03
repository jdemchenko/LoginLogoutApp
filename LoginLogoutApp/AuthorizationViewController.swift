//
//  ViewController.swift
//  LoginLogoutApp
//
//  Created by Ivan Demchenko on 31.03.21.
//

import UIKit

class AuthorizationViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInStackView: UIStackView!
    
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var forgotUserNameBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    // MARK: - Private Properties
    private let userName = "jdemchenko"
    private let password = "password"
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInBtn.layer.cornerRadius = 5
        
        autoShrinkForButton(button: forgotUserNameBtn)
        autoShrinkForButton(button: forgotPasswordBtn)
        autoShrinkForButton(button: logInBtn)
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? InAppViewController else { return }
        destination.userName = userNameTF.text
    }
    
    // MARK: - IB Actions
    @IBAction func logInBtnPressed() {
        checkUsernameAndPassword()
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Don't worry!", message: "Your username is \(userName)")
            : showAlert(title: "Don't worry!", message: "Your password is \(password)")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    // MARK: - Up the view when keyboard up
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y - 90, width:self.view.frame.size.width, height:self.view.frame.size.height)
        })
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y + 90, width:self.view.frame.size.width, height:self.view.frame.size.height)
        })
    }
    
    // MARK: - Change size of buttons foe differents screens
    func autoShrinkForButton(button: UIButton) {
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.minimumScaleFactor = 0.5
        button.clipsToBounds = true
    }
    
    
    // MARK: - Private Methods
    private func checkUsernameAndPassword() {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(title: "Error", message: "The username or password is incorrect. Please check your username and password and try again.")
            passwordTF.text = nil
            return
        }
        performSegue(withIdentifier: "logInIdentifier", sender: .none)
    }
}


// MARK: - Alert Controller
extension AuthorizationViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Work with keyboard
extension AuthorizationViewController: UITextFieldDelegate {
    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {//delegate method
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInBtnPressed()
        }
        return true
    }
}
