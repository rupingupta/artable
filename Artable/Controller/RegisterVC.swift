//
//  RegisterVC.swift
//  Artable
//
//  Created by Rupin Gupta on 27/01/19.
//  Copyright © 2019 Rupin Gupta. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    //outlets
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var passCheckImg: UIImageView!
    
    
    @IBOutlet weak var confPassCheckImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let passText = passwordTxt.text else {
            return
        }
        
        
        if textField == confirmPassTxt {
            passCheckImg.isHidden = false
            confPassCheckImg.isHidden = false
        }
        else {
            if passText.isEmpty {
            passCheckImg.isHidden = true
            confPassCheckImg.isHidden = true
            confirmPassTxt.text = ""
            }
        }
        
        if passwordTxt.text == confirmPassTxt.text {
            passCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        }
        else {
            passCheckImg.image = UIImage(named: AppImages.RedCheck)
            confPassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
        
        
        
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
        guard let email = emailTxt.text , email.isNotEmpty,
            let password = passwordTxt.text , password.isNotEmpty ,
            let userName = userNameTxt.text , userName.isNotEmpty else {
                return
        }
            activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            // ...
            
            if let error = error {
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            print("Successfully registered User")
            
           // guard let user = authResult?.user else { return }
        }
        
        
    }
    
    
    
}
