//
//  ViewController.swift
//  AnimeAlerts
//
//  Created by BenD on 10/4/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let getData = animeDatabase.singleInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName:"AnimeViewCell", bundle:nil)
        tableView.register(nib, forCellReuseIdentifier: "AnimeViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
        return viewCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //forcing table view cell height to a specifc value
        return 100
    }
    
}

