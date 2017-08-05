//
//  CreateAcoountVC.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 8/1/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import UIKit

class CreateAcoountVC: UIViewController {
    
    
//    outlets
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
//    variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
   
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    
    @IBAction func createAcoountPressed(_ sender: Any) {
        
        guard let name = userField.text , userField.text != "" else
        {return}
        
        guard let email = emailField.text , emailField.text != "" else
        {return}
        
        guard let pass = passwordField.text , passwordField.text != "" else
        {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }

}
