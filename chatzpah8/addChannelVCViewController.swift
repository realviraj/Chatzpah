//
//  addChannelVCViewController.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 8/23/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import UIKit

class addChannelVCViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var chanDesc: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createChannelPressd(_ sender: Any) {
        
        guard  let channelName = nameText.text, nameText.text != "" else { return }
        guard  let channelDesc = chanDesc.text, chanDesc.text != "" else { return }
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setUpView() {
        let closeTouch =  UITapGestureRecognizer(target: self, action: #selector(addChannelVCViewController.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameText.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSForegroundColorAttributeName: chatsPurplePlaceholder])
        
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSForegroundColorAttributeName: chatsPurplePlaceholder])
    }
    
    @objc func closeTap(_ recognize: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
    }
    

}
