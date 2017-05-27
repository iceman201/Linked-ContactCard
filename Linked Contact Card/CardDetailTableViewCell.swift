//
//  CardDetailTableViewCell.swift
//  Linked Contact Card
//
//  Created by Ben Duke on 27/05/17.
//  Copyright © 2017 Ben Duke. All rights reserved.
//

import UIKit

class CardDetailTableViewCell: UITableViewCell {

    //MARK: Properties
    
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
