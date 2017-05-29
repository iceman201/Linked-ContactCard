//
//  Card.swift
//  Linked Contact Card
//
//  Created by Ben Duke on 26/05/17.
//  Copyright © 2017 Ben Duke. All rights reserved.
//

import UIKit

private let _cardInstance = Card()
class Card: NSObject {
    
    final class var sharedInstance: Card{
    return _cardInstance
    }
    var firstName : String?
    var lastName : String?
    var jobTitle : String?
    var company : String?
    var email : String?
    var photo: UIImage?
    var phone : String?
    
    //MARK: Initialization
    var  cardArray : [Card] = []
    
}
