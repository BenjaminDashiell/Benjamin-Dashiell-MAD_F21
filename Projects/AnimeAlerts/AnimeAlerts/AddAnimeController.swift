//
//  AddAnimeController.swift
//  AnimeAlerts
//
//  Created by BenD on 10/4/21.
//

import UIKit

class AddAnimeController: UIViewController, UITextFieldDelegate {

    //variables
    @IBOutlet weak var userAnimeTitle: UITextField!
    @IBOutlet weak var userAnimeImage: UITextField! //for now, I'll input the name of a image file in the project. will be replaced by camera roll if there's time
    @IBOutlet weak var userDateTime: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    @IBOutlet weak var userAlertStatus: UISwitch!
    
    override func viewDidLoad() {
        userAnimeTitle.delegate = self
        userAnimeImage.delegate = self
        
        //.short displays dates in this format “11/23/19” and times in this format “3:48 PM”
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        super.viewDidLoad()
    }
    
    //keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let mainVC = segue.destination as! ViewController
            
            let selectedDate: String = dateFormatter.string(from: userDateTime.date)
            //print(selectedDate)
            let dateTime = selectedDate.components(separatedBy: ", ")
            //print(dateTime)
            
            var alertBool = false
            if(userAlertStatus.isOn){
                alertBool = true
            }
            else{
                alertBool = false
            }
            //print(alertBool)
            
            if userAnimeTitle.text?.isEmpty == false && userAnimeImage.text?.isEmpty == false {
                mainVC.getData.addToDB(animeEntry: Anime(animeTitle: userAnimeTitle.text ?? "", animeImage: userAnimeImage.text ?? "testbg", animeDate: dateTime[0], animeTime: dateTime[1], currentAlertStatus: alertBool))
                mainVC.getData.printDB()
            }
            else{
                //Do nothing. Will not affect the DB or tableview
            }
        }
        else if segue.identifier == "cancelSegue"{
            //Do nothing. Will not affect the DB or tableview
        }
    }
}
