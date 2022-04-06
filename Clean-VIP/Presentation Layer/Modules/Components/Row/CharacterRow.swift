//
//  CharacterRow.swift
//  Clean-VIP
//
//  Created by MacSivsa on 6/4/22.
//

import UIKit

class CharacterRow: UITableViewCell {
    
    
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var artwork: UIImageView!
    @IBOutlet weak var container: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        self.container.layer.cornerRadius = 12
        self.container.layer.borderWidth = 0.5
        self.container.layer.borderColor = UIColor.black.cgColor
        self.container.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
