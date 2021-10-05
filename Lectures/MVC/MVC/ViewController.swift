//
//  ViewController.swift
//  MVC
//
//  Created by BenD on 9/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var user = Favorite() //instance of favorite class
    //this is used in the other VC prepare
    //and then passed to unwindSegue to update THIS VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        bookLabel.text=user.favBook
        authorLabel.text=user.favAuthor
    }
}

