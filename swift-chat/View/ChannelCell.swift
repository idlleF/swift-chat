//
//  ChannelCell.swift
//  swift-chat
//
//  Created by Irko Stoyanov on 17.11.18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var channelName: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            
        }
    }

}
