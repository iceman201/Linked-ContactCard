//
//  CardListTableViewController.swift
//  Linked Contact Card
//
//  Created by Ben Duke on 27/05/17.
//  Copyright © 2017 Ben Duke. All rights reserved.
//

import UIKit

class CardListTableViewController: UITableViewController {
    
    var cards = Card.sharedInstance.cardArray
    var passedCard : Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I didload")
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if passedCard != nil{
            cards.append(passedCard!)
        }
        
        if cards.count < 1
        {
            loadSampleCards()
            
        }
        print("\(cards.count) is in cards")
        print("I reapppered")
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cards.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCardCell", for: indexPath) as? CardListTableViewCell else{
            return UITableViewCell()
        }
        
        // Configure the cell...
        let fName = cards[indexPath.row].firstName!
        let lName = cards[indexPath.row].lastName!
        cell.fullNameLabel.text = "\(fName) " + "\(lName)"
        cell.jobTitleLabel.text = cards[indexPath.row].jobTitle
        cell.companyLabel.text = cards[indexPath.row].company
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     s
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCard" {
            if let vc = segue.destination as? CardTableViewController {
                vc.card = cards
                print("Passing card")
            }
        }
    }
    
    // Private methods
    private func loadSampleCards() {
        let sampleCard1 = Card()
        sampleCard1.firstName = "John"
        sampleCard1.lastName = "Doe"
        sampleCard1.jobTitle = "CEO"
        sampleCard1.company = "XYZ"
        cards.append(sampleCard1)
    }
}
