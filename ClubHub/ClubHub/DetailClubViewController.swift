//
//  DetailClubViewController.swift
//  ClubHub
//
//  Created by marcela nunez on 10/27/22.
//

import UIKit
import Parse

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
