//
//  ChannelCell.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 8/11/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
//    outlets
    @IBOutlet weak var channelName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configCell(channel: Channel) {
        let title = channel.channelTitle!
        channelName.text = "#\(title)"
        channelName.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        for id in MessageServices.instance.unreadChannels {
            if id == channel.id {
                channelName.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
            }
        }
        
    }

}
