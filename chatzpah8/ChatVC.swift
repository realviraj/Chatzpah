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
    @IBOutlet weak var msgTextbox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        get back down the keyboard
        view.bindToKeyboard()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.handleTap))
        view.addGestureRecognizer(tap)
//        get back down the keyboard
        
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
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    func updateWithChannel() {
        let channelName = MessageServices.instance.selectedChannels?.channelTitle ?? ""
        channelNameLabl.text = "#\(channelName)"
        getMessages()
    }
    
    
    @IBAction func sendMsgPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            guard let channelId = MessageServices.instance.selectedChannels?.id else { return }
            guard let message = msgTextbox.text else { return }
            SocketService.instance.addMessage(messageBody: message, userId: UserDataService.instance.id, channelId: channelId, completion: { (success) in
                self.msgTextbox.text = ""
                self.msgTextbox.resignFirstResponder()
            })
        }
    }
    
    
    func onLoginGetMessages() {
        MessageServices.instance.findAllChannel { (success) in
            if success {
//                do stuff with channels
                if MessageServices.instance.channels.count > 0 {
                    MessageServices.instance.selectedChannels = MessageServices.instance.channels[0]
                    self.updateWithChannel()
                } else {
                    self.channelNameLabl.text = "No Channels Yet"
                    
                }
            }
        }
    }
    
    
    
    func getMessages() {
        guard let channelId = MessageServices.instance.selectedChannels?.id else {return}
        MessageServices.instance.findAllMesssagesForChannels(channelId: channelId) { (success) in
        }
    }
}
