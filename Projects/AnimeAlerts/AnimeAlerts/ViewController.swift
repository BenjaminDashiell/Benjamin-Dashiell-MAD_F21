//
//  ViewController.swift
//  AnimeAlerts
//
//  Created by BenD on 10/4/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //variables
    @IBOutlet var tableView: UITableView!
    var getData = animeDatabase.singleInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName:"AnimeViewCell", bundle:nil)
        tableView.register(nib, forCellReuseIdentifier: "AnimeViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //UITableView functions (required)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData.getDB().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let extractData = getData.getDB()
        let viewCell = tableView.dequeueReusableCell(withIdentifier: "AnimeViewCell", for: indexPath) as! AnimeViewCell
        viewCell.animeTitle.text = extractData[indexPath.row].title
        viewCell.dateTime.text = extractData[indexPath.row].date+" @ "+extractData[indexPath.row].time
        viewCell.backgroundView = UIImageView(image: UIImage(named: extractData[indexPath.row].image)!)
        viewCell.alarmOnOff.setOn(extractData[indexPath.row].alarmStatus, animated: false)
        return viewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //forcing table view cell height to a specifc value
        return 100
    }
    
    //Segues
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        //print("new table count is : ", getData.getDB().count)
        tableView.reloadData() //property allows for tableView to autorefresh
    }
}

