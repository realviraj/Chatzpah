//
//  LoginVC.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 8/1/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
//    outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    @IBAction func loginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = userNameTxt.text , userNameTxt.text != "" else
        {return}
        
        guard let pass = passwordTxt.text , passwordTxt.text != "" else
        {return}
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createAccBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATEACCOUNT, sender: nil)
    }
    func setUpView() {
        spinner.isHidden = true
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName: chatsPurplePlaceholder])
        
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName: chatsPurplePlaceholder])
    }
}
