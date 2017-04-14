//
//  PlayerCell.swift
//  
//
//  Created by R_style_Man on 15/6/14.
//
//

import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var gameLabel:UILabel!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var ratingImageView:UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
