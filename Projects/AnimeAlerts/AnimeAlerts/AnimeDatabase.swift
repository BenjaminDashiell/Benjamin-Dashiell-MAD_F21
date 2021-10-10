//
//  AnimeDatabase.swift
//  AnimeAlerts
//
//  Created by BenD on 10/4/21.
//

import Foundation
import UIKit

class Anime{
    var title: String = ""
    var date: String = ""
    var time: String = ""
    var alarmStatus = false
    var uiimage: UIImageView?
    
    init(animeTitle: String, animeUIIV: UIImageView, animeDate: String, animeTime: String, currentAlertStatus: Bool){
        title = animeTitle
        uiimage = animeUIIV
        date = animeDate
        time = animeTime
        alarmStatus = currentAlertStatus
    }
    
    func printTest(){
        print(title)
        //print(date)
        //print(time)
        print(alarmStatus)
    }
}

final class animeDatabase{
    private var animeDB: [Anime] = [] // array of Anime objects
    static let singleInstance: animeDatabase = animeDatabase() //Singleton pattern to only allow a single instance of animeDatabase to be called and referred to
    
    private init(){
        //initialize var animeDB with hardcoded Anime Objects
        animeDB.append(Anime(animeTitle: "Scarlet Nexus", animeUIIV: UIImageView(image: UIImage(named: "scarletNexus")),animeDate: "7/1/21",animeTime: "7:30 AM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Love Live! Superstar!!",animeUIIV: UIImageView(image: UIImage(named: "loveLiveSuperstar")),animeDate: "7/11/21",animeTime: "12:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Pirate Princess",animeUIIV: UIImageView(image: UIImage(named: "piratePrincess")),animeDate: "8/14/21",animeTime: "10:00 PM",currentAlertStatus: true))
        animeDB.append(Anime(animeTitle: "86 2nd Season",animeUIIV: UIImageView(image: UIImage(named: "86_s2")),animeDate: "10/3/21",animeTime: "10:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Komi-San",animeUIIV: UIImageView(image: UIImage(named: "komisan")),animeDate: "10/6/21",animeTime: "9:00 AM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "World Trigger 3rd Season",animeUIIV: UIImageView(image: UIImage(named: "worldTrigger-s3")),animeDate: "10/10/21",animeTime: "10:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "My Hero Academia the Movie 3",animeUIIV: UIImageView(image: UIImage(named: "mhaMovie3")),animeDate: "10/29/21",animeTime: "6:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "SAO Progressive",animeUIIV: UIImageView(image: UIImage(named: "saoProgressive")),animeDate: "12/3/21",animeTime: "8:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Demon Slayer: Entertainment District Arc",animeUIIV: UIImageView(image: UIImage(named: "demonSlayer-s2")),animeDate: "12/5/21",animeTime: "8:00 AM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Attack on Titan Final Season Part 2",animeUIIV: UIImageView(image: UIImage(named: "aots4p2")),animeDate: "1/1/22",animeTime: "10:00 PM",currentAlertStatus: false))
    }

    func addToDB(animeEntry: Anime){
        //insert Anime object to end of database
        animeDB.append(animeEntry)
    }

    func getDB()-> [Anime]{
        return animeDB
    }
       
    func updateAnimeAlert(animeName: String, boolStatus: Bool){
        for a in animeDB{
            if(a.title == animeName){
                a.alarmStatus = boolStatus
            }
        }
    }
 
    //for testing
    func printDB(){
        for a in animeDB{
            print(a.printTest())
        }
    }
}
