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
    @IBOutlet weak var alarmOnOff: UISwitch!
    @IBAction func alarmSwitch(_ sender: UISwitch) {
        //does nothing currently since can't do push notifactions
    }
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
