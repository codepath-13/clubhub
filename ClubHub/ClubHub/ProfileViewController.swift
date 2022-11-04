//
//  ProfileViewController.swift
//  ClubHub
//
//  Created by marcela nunez on 11/4/22.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //load user details
        let userFirstName = PFUser.current()?.object(forKey: "username") as! String
        let schoolname = PFUser.current()?.object(forKey: "school") as! String
        
        if PFUser.current()?.object(forKey: "bio") != nil {
            let bio = PFUser.current()?.object(forKey: "bio") as! String
            bioTextView.text = bio
        } else {
            bioTextView.text = ""
            print("bio wasn’t set successfully")
        }
        
        FirstNameTextField.text = userFirstName
        lastNameTextField.text = schoolname
        
        
        if PFUser.current()?.object(forKey: "profileImage") != nil {
            let imageFile = PFUser.current()?.object(forKey: "profileImage") as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string:urlString)!
            profileImageView.af.setImage(withURL: url)
        } else {
            print("profile image wasn’t set successfully")
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateButton(_ sender: Any) {
        let myUser: PFUser = PFUser.current()!
        
        if((FirstNameTextField.text == "") || (lastNameTextField.text == "")){
            
            // Create new Alert
            let dialogMessage = UIAlertController(title: "Confirm", message: "Fields cannot be empty", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        } else {
        
        //set new values
        let userName = FirstNameTextField.text
        let schoolName = lastNameTextField.text
        
        myUser.setObject(userName, forKey: "username")
        myUser.setObject(schoolName, forKey: "school")
        
        if profileImageView.image != nil {
            let imageData = profileImageView.image!.pngData()
            let file = PFFileObject(data:imageData!)
            myUser.setObject(file, forKey: "profileImage")
        }
        
        if bioTextView.text != ""{
            myUser.setObject(bioTextView.text, forKey: "bio")
        }
        

        myUser.saveInBackground{(success, error) in
            if success {
                // Create new Alert
                let dialogMessage = UIAlertController(title: "Success", message: "Profile successfully updated", preferredStyle: .alert)
                // Create OK button with action handler
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button tapped")
                 })
                
                //Add OK button to a dialog message
                dialogMessage.addAction(ok)
                // Present Alert to
                self.present(dialogMessage, animated: true, completion: nil)
                print("updated")
            } else {
                print("error!")
            }
        }
        }
        
    }
    
    @IBAction func cameraClick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else{
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated:true, completion:nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        
        profileImageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
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
