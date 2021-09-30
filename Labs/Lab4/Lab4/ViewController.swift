//
//  ViewController.swift
//  Lab4
//
//  Created by BenD on 9/29/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var numEpisodes: UILabel!
    @IBOutlet weak var episodeStepper: UIStepper!
    @IBOutlet weak var runtimeInput: UITextField!
    @IBAction func calcButton(_ sender: Any) {
        if runtimeInput.text!.isEmpty{
            //print("ALERT IS CALLED")
            let alert=UIAlertController(title: "Warning", message: "The input field for runtime cannot be left empty", preferredStyle: UIAlertController.Style.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction) //adds the alert action to the alert object
            let okAction=UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil) //don't feel I need to add a handler for this alert
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            //print("ALERT IS NOT CALLED")
            calcTotalHours()
        }
    }
    @IBAction func updateNumEpisodes(_ sender: UIStepper) {
        numEpisodes.text=String(format: "%.0f", episodeStepper.value)
    }
    @IBOutlet weak var totalHours: UILabel!
    
    func calcTotalHours(){
        //print(Int(episodeStepper.value))
        //print(Int(runtimeInput.text!)!)
        let totalMinutes = Int(episodeStepper.value) * Int(runtimeInput.text!)!
        //print(totalMinutes)
        let hourCalculation = Double(totalMinutes)/60.0 //needs to be a double type for calculations ending with .75, .5, and .25
        //print(hourCalculation)
        totalHours.text=String(format: "%.2f", hourCalculation)
    }
    
    //keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //the keyboard is the "first responder"
        //so we're resigning it when we're done
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        return
    }
    
    override func viewDidLoad() {
        runtimeInput.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Code from ch7
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 { self.view.frame.origin.y -= keyboardSize.height
                }
            }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 { self.view.frame.origin.y = 0}
        }
    }
}
