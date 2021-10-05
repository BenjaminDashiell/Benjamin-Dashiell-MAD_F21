//
//  AnimeViewCell.swift
//  AnimeAlerts
//
//  Created by BenD on 10/4/21.
//

import UIKit

class AnimeViewCell: UITableViewCell {

    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    @IBAction func alarmSwitch(_ sender: UISwitch) {
        //does nothing currently since can't do push notifactions
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
