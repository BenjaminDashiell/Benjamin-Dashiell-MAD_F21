//
//  ViewController.swift
//  Lab3
//
//  Created by BenD on 9/20/21.
//

import UIKit

class ViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var changeImageText: UISegmentedControl!
    @IBOutlet weak var capsSwitch: UISwitch!
    @IBOutlet weak var fontSize: UILabel!
    @IBOutlet weak var fontTypeSwitch: UISwitch!
    
    // Methods
    func updateImage(){
        if(changeImageText.selectedSegmentIndex==1){
            displayImage.image=UIImage(named: "Fall21_240x240")
            displayText.text="Fall 21 Showings"
        }
        else if(changeImageText.selectedSegmentIndex==0){
            displayImage.image=UIImage(named: "Spring21_240x240")
            displayText.text="Spring 21 Showings"
        }
    }
    
    func updateCaps(){
        if capsSwitch.isOn{
            displayText.text=displayText.text?.uppercased()
        }
        else {
            displayText.text=displayText.text?.lowercased()
        }
    }
    
    func updateFontType(){
        /* I was trying a couple methods for changing the
        text font and they weren't working. I'm not sure why.
        I'd assume maybe I didn't give it the right font name.
         
        So now this is just update font color now
        */
        if fontTypeSwitch.isOn{
            //let newFont = UIFont(name: "Headline", size: 17.0)
            //displayText.font = newFont
            displayText.textColor = UIColor.red
        }
        else {
            //let newFont = UIFont(name: "System", size: 17.0)
            //displayText.font = newFont
            displayText.textColor = UIColor.black
        }
    }
    
    // IBAction
    @IBAction func updateInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        updateFontType()
        updateCaps()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSizeValue=sender.value
        fontSize.text=String(format: "%.0f", fontSizeValue)
        let fontSizeCGFloat=CGFloat(fontSizeValue)
        displayText.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

