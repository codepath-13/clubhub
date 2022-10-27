//
//  AddClubViewController.swift
//  ClubHub
//
//  Created by marcela nunez on 10/26/22.
//

import UIKit
import AlamofireImage
import Parse

class AddClubViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var clubNameField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.textColor = .lightGray
        textView.text = "Type description here..."
        self.textView.layer.borderColor = UIColor.lightGray.cgColor
        self.textView.layer.borderWidth = 1
    }
    
   
    @IBAction func onAddClub(_ sender: Any) {
        
        let post = PFObject(className: "Club")
        
        post["ClubID"] = UUID().uuidString //unique identifier for the new club
        post["description"] = textView.text!
        post["email"] = mailField.text!
        post["clubName"] = clubNameField.text!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data:imageData!)
        
        post["image"] = file
        
        post.saveInBackground{(success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved")
            } else {
                print("error!")
            }
        }
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
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
        
        imageView.image = scaledImage
        
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
