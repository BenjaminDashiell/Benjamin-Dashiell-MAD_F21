//
//  AddAnimeController.swift
//  AnimeAlerts
//
//  Created by BenD on 10/4/21.
//

import UIKit

class AddAnimeController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //variables
    @IBOutlet weak var userAnimeTitle: UITextField!
    @IBOutlet weak var userImageSelect: UIImageView!
    @IBOutlet weak var userDateTime: UIDatePicker!
    @IBOutlet weak var userAlertStatus: UISwitch!
    
    let dateFormatter: DateFormatter = DateFormatter()
    var passUserImage: UIImageView?
    
    override func viewDidLoad() {
        userAnimeTitle.delegate = self
        
        //.short displays dates in this format “11/23/19” and times in this format “3:48 PM”
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        super.viewDidLoad()
    }
    
    //Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //For User Selecting Their Own Image
    @IBAction func selectImage(_ sender: UIButton){
        let uiv = UIImagePickerController()
        uiv.sourceType = .photoLibrary
        uiv.delegate = self
        uiv.allowsEditing = true
        present(uiv,animated:true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //print(info)
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            userImageSelect.image = image
            let originalImage = UIImageView(image: image)
            let croppedImage = cropImage(image: originalImage.image!, rect: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.width*(2/7)), scale: 1.0)
            passUserImage = UIImageView(image: croppedImage!)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Crop Function
    func cropImage(image: UIImage, rect: CGRect, scale: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: rect.size.width / scale, height: rect.size.height / scale), true, 0.0)
        image.draw(at: CGPoint(x: -rect.origin.x / scale, y: -rect.origin.y / scale))
        let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return croppedImage
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let mainVC = segue.destination as! ViewController
            //assumption: User has to put a title for an user alert to be valid
            if userAnimeTitle.text?.isEmpty == false {
                if passUserImage == nil{
                    passUserImage = UIImageView(image: UIImage(named:"testbg"))
                }
                
                let selectedDate: String = dateFormatter.string(from: userDateTime.date)
                //print(selectedDate)
                let dateTime = selectedDate.components(separatedBy: ", ")
                //print(dateTime)
                
                var alertBool = false
                if(userAlertStatus.isOn){
                    alertBool = true
                }
                else{
                    alertBool = false
                }
                //print(alertBool)
                
                //pass new entry to the DB
                mainVC.getData.addToDB(animeEntry: Anime(animeTitle: userAnimeTitle.text!, animeUIIV: passUserImage!, animeDate: dateTime[0], animeTime: dateTime[1], currentAlertStatus: alertBool))
            }
            else{
                //Do nothing. Will not affect the DB or tableview
            }
        }
        else if segue.identifier == "cancelSegue"{
            //Do nothing. Will not affect the DB or tableview
        }
    }
}
