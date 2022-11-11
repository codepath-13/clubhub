//
//  JoinedDetailViewController.swift
//  ClubHub
//
//  Created by Salem Nassar on 11/11/22.
//

import UIKit
import Parse
import AlamofireImage
class JoinedDetailViewController: UIViewController {
    var club: PFObject!

    @IBOutlet weak var clubEmailLabel: UILabel!
    @IBOutlet weak var clubDescriptionLabel: UILabel!
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var clubImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print(club["clubName"] as! String)

        clubNameLabel.text = club["clubName"] as? String
        clubDescriptionLabel.text = club["description"] as? String
        clubEmailLabel.text = club["email"] as? String
        
        let imageFile = club["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string:urlString)!
        
        clubImage.af.setImage(withURL: url)
        // Do any additional setup after loading the view.
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
