//
//  PortfolioViewController.swift
//  LoginLogoutApp
//
//  Created by macbook on 5.04.21.
//

import UIKit

class LinksViewController: UIViewController {
    
    @IBOutlet weak var linksOfUser: UILabel!
    
    var links: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        linksOfUser.text = links
    }
    


}
