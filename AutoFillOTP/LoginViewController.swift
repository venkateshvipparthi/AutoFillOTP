//
//  ViewController.swift
//  AutoFillOTP
//
//  Created by Admin on 19/05/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var otpReceiverTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
   private let otpReceived = "4719"

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
        UpdateUI()
    }
    
  private func UpdateUI() {
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(self.keyboardDidShow),
            name: UITextField.textDidChangeNotification,
            object: otpReceiverTextField)
        otpReceiverTextField.becomeFirstResponder()
    }
    
    @objc func keyboardDidShow(notifcation: NSNotification) {
        
        if otpVerification(otpText: otpReceiverTextField.text ?? ""){
            loginButton.isEnabled = true
            loginAction(loginButton)
        }
        else{
            loginButton.isEnabled = false
            if otpReceiverTextField.text?.count == 4 {
                alertMessage()
                otpReceiverTextField.text = ""
            }
        }

    }
    
    @IBAction func loginAction(_ sender: Any) {
        let loginStoryBoardID: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC =
        loginStoryBoardID.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
 private func otpVerification(otpText: String)-> Bool {
            return otpText == otpReceived ? true : false
        }
    
    private func alertMessage() {
        let alertView = UIAlertController(title:"Alert", message:"Incorrect OTP received", preferredStyle:.alert)
        
        let action = UIAlertAction(title:"Ok", style: .cancel)
        
        alertView.addAction(action)
        
        self.present(alertView, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

