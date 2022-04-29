//
//  TimerTableViewCell.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import UIKit

class TimerTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var txtCloudCover: UILabel!
   
    @IBOutlet weak var txtSeeing: UILabel!
    
    @IBOutlet weak var txtTransparency: UILabel!
    
    @IBOutlet weak var txtRh2m: UILabel!
    
    @IBOutlet weak var txtWinDirection: UILabel!
    
    @IBOutlet weak var txtWin10MSpeed: UILabel!
    
    @IBOutlet weak var txtPrecType: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
