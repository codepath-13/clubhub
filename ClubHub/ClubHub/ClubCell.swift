//
//  ClubCell.swift
//  ClubHub
//
//  Created by marcela nunez on 10/26/22.
//

import UIKit

class ClubCell: UITableViewCell {

     
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

