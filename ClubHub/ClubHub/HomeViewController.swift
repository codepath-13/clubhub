//
//  HomeViewController.swift
//  ClubHub
//
//  Created by Salem Nassar on 11/10/22.
//

import UIKit
import Parse
import AlamofireImage
class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let user = PFUser.current()
    var getClubs = [PFObject]()
    var joinedClubs = [PFObject]()
    var clubIDs = [String]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        clubIDs.removeAll()
        getClubs = (user!["clubs"] as! [PFObject])
        print("test getting data:")
        if !getClubs.isEmpty{
            for club in getClubs{
                clubIDs.append(club.objectId!)
            }
        }
        print(clubIDs)
        let query = PFQuery(className: "Club")
        query.whereKey("objectId", containedIn: clubIDs)
        query.findObjectsInBackground{(clubs, error)in
            if clubs != nil{
                self.joinedClubs = clubs!
                self.collectionView.reloadData()
                print(self.joinedClubs)
            }else{
                print("couldn't find clubs")
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return joinedClubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JoinedClubCell", for: indexPath) as! JoinedClubCell
        let currClub = joinedClubs[indexPath.item]
        let imageFile = currClub["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string:urlString)!
        
        cell.joinedClubImage.af.setImage(withURL: url)
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "joinedDetailSegue" {
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let club = joinedClubs[indexPath.item]
            
            let joinedDetailViewController = segue.destination as! JoinedDetailViewController
            
            joinedDetailViewController.club = club
            
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }


}
