//
//  ViewController.swift
//  Lab1
//
//  Created by BenD on 9/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var displayText: UILabel!
    
    @IBAction func chooseAbout(_ sender: UIButton) {
        if sender.tag == 1 {
            displayImage.image=UIImage(named: "AnimeMeme")
            displayText.text = "Welcome to CU Anime Club, a home for all otakus. We watch anime, play games, and socialize with fellow anime enthusiasts. Games include anything from trivias, tournaments, scavenger hunts, etc, and are conducted every other meeting (biweekly). There are no strict requirements or commitments for this club. We're very casual. Just come to enjoy a good time!"
        }
        else if sender.tag == 2{
            displayImage.image=UIImage(named: "AnimeF21")
            displayText.text = "Showings for Fall 2021 semester (from top left to bottom right): \n - Jujitsu Kaisen \n - Pirate Princess \n - Nichijou \n - Odd Taxi"
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

