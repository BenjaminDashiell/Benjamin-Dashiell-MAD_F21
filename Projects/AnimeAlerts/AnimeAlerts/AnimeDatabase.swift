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
        animeDB.append(Anime(animeTitle: "Demon Slayer",animeImage: "",animeDate: "12-01-21",animeTime: "9PM",currentAlertStatus: false))
        animeDB.append(Anime(animeTitle: "Sword Art Online",animeImage: "",animeDate: "12-01-21",animeTime: "8PM",currentAlertStatus: true))
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
