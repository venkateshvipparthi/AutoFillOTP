//
//  ProfileViewController.swift
//  AutoFillOTP
//
//  Created by Admin on 19/05/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var successLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        successLabel.text = "You have successfully logged in..."
    }
}
