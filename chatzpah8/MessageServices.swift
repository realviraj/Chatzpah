//
//  MessageServices.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 8/11/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageServices {
    static let instance = MessageServices()
    
    var channels = [Channel]()
    var selectedChannels : Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNEL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                if let json = JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
}
