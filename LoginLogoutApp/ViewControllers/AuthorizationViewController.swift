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
    private let user = User.getLogInInfo()
    private let alert = Alert.getAlert()
    
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
        let tabBarController = segue.destination as! UITabBarController
        let viewControllers = tabBarController.viewControllers!
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? InAppViewController {
                welcomeVC.personData = user.person
            } else if let navigationVC = viewController as? UINavigationController {
                if let aboutUserVC = navigationVC.topViewController as? AboutViewController{
                    aboutUserVC.personDataOfUser = user.person
                }
                if let linksOfUserVC = navigationVC.topViewController as? LinksViewController{
                    linksOfUserVC.links = user.person.links
                }
            }
        }
        
    }
    
    // MARK: - IB Actions
    @IBAction func logInBtnPressed() {
        checkUsernameAndPassword()
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Don't worry!",
                        message: "Your username is \(user.userName)")
            : showAlert(title: "Don't worry!",
                        message: "Your password is \(user.password)")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
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
        if userNameTF.text != user.userName || passwordTF.text != user.password {
            showAlert(title: alert.title, message: alert.message)
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
