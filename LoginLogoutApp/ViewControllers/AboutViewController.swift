//
//  AboutViewController.swift
//  LoginLogoutApp
//
//  Created by macbook on 5.04.21.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var textAbout: UILabel!
    @IBOutlet weak var photoOfUser: UIImageView!
    
    var name: String!
    var surname: String!
    var hobby: String!
    var age: Int!
    var nationality: String!
    var photoName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoOfUser.image = UIImage.init(named: photoName!)
        
        textAbout.text =
            "Name: \(name!)\n" +
            "Surname: \(surname!)\n" +
            "Age: \(age!)\n" +
            "Hobby: \(hobby!)\n" +
            "Nationality: \(nationality!)"
    }
    
}
