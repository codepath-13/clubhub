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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(club["clubName"] as! String)
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
