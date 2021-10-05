//
//  AnimeDatabase.swift
//  AnimeAlerts
//
//  Created by BenD on 10/4/21.
//

import Foundation

class Anime{
    var title: String = ""
    var image: String = "" //image assets are uploaded. This is their filename
    var date: String = ""
    var time: String = ""
    var alarmStatus = false

    init(animeTitle: String, animeImage: String, animeDate: String, animeTime: String, currentAlertStatus: Bool){
        title = animeTitle
        image = animeImage
        date = animeDate
        time = animeTime
        alarmStatus = currentAlertStatus
    }
    
    func printTest(){
        print(title)
        print(image)
        print(date)
        print(time)
        print(alarmStatus)
    }
}

final class animeDatabase{
    private var animeDB: [Anime] = [] // array of Anime objects
    static let singleInstance: animeDatabase = animeDatabase()
    
    private init(){
        //initialize var animeDB with hardcoded Anime Objects
        animeDB.append(Anime(animeTitle: "Scarlet Nexus",animeImage: "testbg",animeDate: "7-1-21",animeTime: "7:30 AM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Love Live! Superstar!!",animeImage: "testbg",animeDate: "7-11-21",animeTime: "12:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Pirate Princess",animeImage: "testbg",animeDate: "8-14-21",animeTime: "10:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "86 2nd Season",animeImage: "testbg",animeDate: "10-3-21",animeTime: "10:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Komi-San",animeImage: "testbg",animeDate: "10-6-21",animeTime: "9:00 AM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "World Trigger 3rd Season",animeImage: "testbg",animeDate: "10-10-21",animeTime: "10:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "My Hero Academia the Movie 3: World Heroes' Mission",animeImage: "testtrans",animeDate: "10-29-21",animeTime: "6:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "SAO Progressive",animeImage: "testbg",animeDate: "12-3-21",animeTime: "8:00 PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Demon Slayer: Entertainment District Arc",animeImage: "testbg",animeDate: "12-5-21",animeTime: "8:00 AM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Attack on Titan Final Season Part 2",animeImage: "testbg",animeDate: "1-1-22",animeTime: "10:00 PM",currentAlertStatus: false))
    }

    //Singleton pattern to only allow a single instance of animeDatabase to be called and referred to
    
    func addToDB(animeEntry: Anime){
        //insert Anime object to end of database
        animeDB.append(animeEntry)
    }

    func getDB()-> [Anime]{
        return animeDB
    }
    
    func printDB(){
        for a in animeDB{
            print(a.printTest())
        }
    }
}
