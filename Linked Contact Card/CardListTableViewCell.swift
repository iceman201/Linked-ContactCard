//
//  CardListTableViewCell.swift
//  Linked Contact Card
//
//  Created by Ben Duke on 27/05/17.
//  Copyright © 2017 Ben Duke. All rights reserved.
//

import UIKit

class CardListTableViewCell: UITableViewCell {

    
    // MARK: Properties
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
