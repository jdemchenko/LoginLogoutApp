//
//  InAppViewController.swift
//  LoginLogoutApp
//
//  Created by Ivan Demchenko on 31.03.21.
//

import UIKit

class InAppViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
 
    var personData: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = personData.name + "\n" + personData.surname
    }
    
}
