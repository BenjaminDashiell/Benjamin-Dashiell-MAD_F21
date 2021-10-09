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
        //print("before updated")
        //print(adb.printDB())
        var alertBool = false
        if(alarmOnOff.isOn){
            alertBool = true
        }
        else{
            alertBool = false
        }
        adb.updateAnimeAlert(animeName: (animeTitle.text)!, boolStatus: alertBool)
        //print("after updated")
        //print(adb.printDB())
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
