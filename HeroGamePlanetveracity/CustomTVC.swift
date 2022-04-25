//
//  CustomTVC.swift
//  HeroGamePlanetveracity
//
//  Created by Pravin Kumar on 25/03/22.
//

import UIKit

class CustomTVC: UITableViewCell {


    @IBOutlet weak var tvcimageview: UIImageView!
    
    @IBOutlet weak var tvcname: UILabel!
    
    @IBOutlet weak var tvcattribute: UILabel!
    
    @IBOutlet weak var tvcattack: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
