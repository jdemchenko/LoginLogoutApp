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
    
    var personDataOfUser: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoOfUser.layer.cornerRadius = photoOfUser.frame.size.width / 2
        photoOfUser.clipsToBounds = true
        photoOfUser.image = UIImage.init(named: personDataOfUser.photo)
        
        textAbout.text =
            "Name: \(personDataOfUser.name)\n" +
            "Surname: \(personDataOfUser.surname)\n" +
            "Age: \(personDataOfUser.age)\n" +
            "Hobby: \(personDataOfUser.hobby)\n" +
            "Nationality: \(personDataOfUser.nationality)"
    }
    
}
