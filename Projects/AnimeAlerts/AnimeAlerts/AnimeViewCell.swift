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
        let adb = animeDatabase.singleInstance
        var alertBool = false
        if(alarmOnOff.isOn){
            alertBool = true
        }
        else{
            alertBool = false
        }
        let splitTitle = animeTitle.text!.components(separatedBy: "    ") //cause I added "     " in front of the titles for the tableviewcells, so updateAnimeAlert wasn't recognizing the animeTitles
        adb.updateAnimeAlert(animeName: splitTitle[1], boolStatus: alertBool)
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
