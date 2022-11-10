//
//  DetailClubViewController.swift
//  ClubHub
//
//  Created by marcela nunez on 10/27/22.
//

import UIKit
import Parse
import AlamofireImage
class DetailClubViewController: UIViewController {
    
    var club: PFObject!
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(club["clubName"] as! String)
        
        clubNameLabel.text = club["clubName"] as? String
        descriptionLabel.text = club["description"] as? String
        emailLabel.text = club["email"] as? String
        
        let imageFile = club["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string:urlString)!
        
        logoView.af.setImage(withURL: url)
     
    }
    
    @IBAction func onJoinCLub(_ sender: Any) {
        club.add(PFUser.current()!, forKey: "members")     // adding User to the list of members
        PFUser.current()!.add(club!, forKey: "clubs")      // adding club to the list of clubs the user has joined

        club.saveInBackground(){(success, error) in // save club object
            if(success){
                print("Member added to list.")
            }else{
                print("Error adding member.")
            }
        }
        
        PFUser.current()!.saveInBackground(){(success: Bool, error: Error?) in // save user object
            if success{
                print("Club added to users clubs.")
            }else{
                print("Error adding club.")
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
