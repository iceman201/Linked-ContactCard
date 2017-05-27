//
//  Card.swift
//  Linked Contact Card
//
//  Created by Ben Duke on 26/05/17.
//  Copyright © 2017 Ben Duke. All rights reserved.
//

import UIKit

class Card {
    var firstName : String
    var lastName : String
    var jobTitle : String
    var company : String
    var email : String
    var photo: UIImage?
    var phone : String
    
    //MARK: Initialization
    
    init?(firstName:String, lastName:String, jobTitle:String, company:String, email:String, phone: String) {
       
        if firstName.isEmpty ||  lastName.isEmpty || email.isEmpty {
            return nil
        }
        self.firstName = firstName
        self.lastName = lastName
        self.jobTitle = jobTitle
        self.company = company
        self.email = email
        self.phone = phone
        
    }
    
}
