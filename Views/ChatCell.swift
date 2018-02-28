//
//  ChatCell.swift
//  chat-client-parse
//
//  Created by user132893 on 2/21/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class ChatCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    var message: PFObject! {
        didSet{
            
            if let user = message["user"] as? PFUser {
                // User found! update username label with username
                usernameLabel.text = user.username
            } else {
                // No user found, set default username
                usernameLabel.text = "🤖"
            }
            messageLabel.text = message.value(forKey: "text") as? String
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
