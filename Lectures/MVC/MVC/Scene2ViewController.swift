//
//  Scene2ViewController.swift
//  MVC
//
//  Created by BenD on 9/30/21.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userBook: UITextField!
    @IBOutlet weak var userAuthor: UITextField!
    
    override func viewDidLoad() {
        userBook.delegate = self
        userAuthor.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneInfo"{
            let scene1VC = segue.destination as! ViewController
            if userBook.text?.isEmpty == false{
                scene1VC.user.favBook=userBook.text
            }
            if userAuthor.text?.isEmpty == false{
                scene1VC.user.favAuthor=userAuthor.text
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
