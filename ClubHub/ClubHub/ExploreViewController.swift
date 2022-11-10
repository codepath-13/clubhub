//
//  ExploreViewController.swift
//  ClubHub
//
//  Created by marcela nunez on 10/26/22.
//

import UIKit
import Parse
import AlamofireImage

class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var tableView: UITableView!
    
    var clubs = [PFObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Club")
        query.includeKey("ClubID")
        query.limit = 20
        
        query.findObjectsInBackground{(clubs,error) in
            if clubs != nil {
                self.clubs = clubs!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClubCell") as! ClubCell
        let club = clubs[indexPath.row]
    
        cell.clubNameLabel.text = club["clubName"] as! String
        cell.descriptionLabel.text = club["description"] as! String
        let imageFile = club["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string:urlString)!
        
        cell.photoView.af.setImage(withURL: url)
        return cell
    }

        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "detailSegue" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            let club = clubs[indexPath.row]
            
            let detailViewController = segue.destination as! DetailClubViewController
            
            detailViewController.club = club
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    

}

