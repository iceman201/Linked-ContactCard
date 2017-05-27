//
//  CardTableViewController.swift
//  Linked Contact Card
//
//  Created by Ben Duke on 27/05/17.
//  Copyright © 2017 Ben Duke. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    // Mark: Properties
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var card : Card?
    
   
    let labelNameArray : [String] = ["First Name", "Last Name", "Job Title", "Email", "Phone"]
    let textFieldNames : [String] = ["First name", "Last Name", "Job Title", "Email", "Phone"] // Place holder will be replaced by real data

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return labelNameArray.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardDetailTableViewCell", for: indexPath) as? CardDetailTableViewCell else{
            return UITableViewCell()
        }
        
        cell.cellLabel.text = labelNameArray[indexPath.row]
        cell.cellTextField.placeholder = textFieldNames[indexPath.row]
        
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else{
            fatalError("Didnt send me back to the previous segue")
        }
        let firstName = "Ben"
        let lastName = "Duke"
        let JobTitle = "IOS Developer"
        let company = "IOS Guys"
        let Email = "Email@mail"
        let Phone = "12345678"
        
        
        
        
        
        print("im here")
        card = Card(firstName: firstName, lastName: lastName, jobTitle: JobTitle, company: company, email: Email, phone: phone)
    }

    
    
}
