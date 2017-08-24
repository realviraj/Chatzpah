//
//  ChatVC.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 7/31/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    
    
//    outlets
    @IBOutlet weak var menuBtn: UIButton!

    @IBOutlet weak var channelNameLabl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DID_CHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNELS_SELECTED, object: nil)
        
//        check if user is logged out
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DID_CHANGE, object: nil)
            })
        }
    }
    @objc func userDataDidChange(_ notif: Notification) {
       if AuthService.instance.isLoggedIn {
//            get channels
            onLoginGetMessages()
        } else {
            channelNameLabl.text = "Please Log In"
        }
    }
     @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
        
    }
    
    func updateWithChannel() {
        let channelName = MessageServices.instance.selectedChannels?.channelTitle ?? ""
        channelNameLabl.text = "#\(channelName)"
    }
    
    
    func onLoginGetMessages() {
        MessageServices.instance.findAllChannel { (success) in
            if success {
//                do stuff with channels
            }
        }
    }
}
