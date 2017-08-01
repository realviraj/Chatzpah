//
//  CreateAcoountVC.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 8/1/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import UIKit

class CreateAcoountVC: UIViewController {
    
    
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
   
    @IBAction func createAcoountPressed(_ sender: Any) {
    }

}
