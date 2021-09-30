//
//  ViewController.swift
//  Sep23rd
//
//  Created by BenD on 9/23/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var checkAmount: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper! //so we can refer to the value of the stepper
    
    @IBOutlet weak var tipDUe: UILabel!
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var totalDuePerPerson: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //the keyboard is the "first responder"
        //so we're resigning it when we're done
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTipTotals()
    }
    
    func updateTipTotals(){
        var amount:Float //check amount
        var pct:Float
        
        if checkAmount.text!.isEmpty{
            amount = 0.0
        }
        else{
            amount=Float(checkAmount.text!)!
        }
        if tipPercent.text!.isEmpty{
            pct = 0.0
        }
        else{
            pct=Float(tipPercent.text!)!
        }
        
        let numberOfPeople=peopleStepper.value
        let tip=amount*pct
        let total=amount+tip
        var personTotal:Float=0.0
        if numberOfPeople>0{
            personTotal=total/Float(numberOfPeople)
        }
        
        //alert code from examples
        
        //format results as currency
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle=NumberFormatter.Style.currency //set the number styte
        tipDUe.text=currencyFormatter.string(from: NSNumber(value:tip)) //returns a formated string
        totalDue.text=currencyFormatter.string(from: NSNumber(value:total))
        totalDuePerPerson.text=currencyFormatter.string(from: NSNumber(value:personTotal))
    }
    
    @IBAction func updatePeople(_ sender: UIStepper) {
        if peopleStepper.value == 1{
            peopleLabel.text="1 person"
        }
        else{
            peopleLabel.text=String(format: "%.0f", peopleStepper.value)+" people"
        }
        //recalc tips
        updateTipTotals()
    }
    
    override func viewDidLoad() {
        checkAmount.delegate=self
        tipPercent.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

