//
//  InAppViewController.swift
//  LoginLogoutApp
//
//  Created by Ivan Demchenko on 31.03.21.
//

import UIKit

class InAppViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    // MARK: - Public Properties
    var userName: String!
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
    }
    
}
