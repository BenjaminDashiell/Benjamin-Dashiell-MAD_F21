//
//  ViewController.swift
//  sep9lecture
//
//  Created by BenD on 9/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            displayText.text = "Young Beatles"
            displayImage.image = UIImage(named: "beatles1")
        }
        else if sender.selectedSegmentIndex == 1{
            displayText.text = "Not So Young Beatles"
            displayImage.image = UIImage(named: "beatles2")
        }
    }
    
    @IBAction func Switch(_ sender: UISwitch) {
        if sender.isOn{
            displayText.text = displayText.text?.uppercased()
        }
        else{
            displayText.text = displayText.text?.lowercased()
        }
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize = sender.value
        fontSizeLabel.text = String(format: "%.0f", fontSize)
        let fontSizeCGFloat = CGFloat(fontSize)
        displayText.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
//"%.0f" means no decimals
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

