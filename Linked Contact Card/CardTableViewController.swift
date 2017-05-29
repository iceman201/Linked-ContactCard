//
//  CardTableViewController.swift
//  Linked Contact Card
//
//  Created by Ben Duke on 27/05/17.
//  Copyright © 2017 Ben Duke. All rights reserved.
//

import UIKit
import CoreData

class CardTableViewController: UITableViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    // Mark: Properties
    var people: [NSManagedObject] = []
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var card : [Card] = Card.sharedInstance.cardArray
    let cardToSave = Card()
    var cardToEdit = Card()
    
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        print(card.count)
        var celldata : [String] = []
        
        let cells = getAllCells()

        for cell in cells {
            guard let textToSave = cell.cellTextField.text else{
             fatalError("Check the code as I didnt get the text")
            }
            celldata.append(textToSave)
        }
        
        // Assign the values to the temp card
        cardToSave.firstName = celldata[0]
        cardToSave.lastName = celldata[1]
        cardToSave.jobTitle = celldata[2]
        cardToSave.company = celldata[3]
        cardToSave.email = celldata[4]
        cardToSave.phone = celldata[5]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
        newUser.setValue(cardToSave.firstName, forKey: "firstName")
        newUser.setValue(cardToSave.lastName, forKey: "lastName")
        newUser.setValue(cardToSave.email, forKey: "email")
        newUser.setValue(cardToSave.company, forKey: "company")
        newUser.setValue(cardToSave.jobTitle, forKey: "jobTitle")
        newUser.setValue(cardToSave.phone, forKey: "phone")
        
        
        // save to core data
        do {
            try context.save()
        } catch let error {
            assertionFailure(error.localizedDescription)
        }
        
        // Append the temp card to the singletion
        Card.sharedInstance.cardArray.append(cardToSave)
        
        //Check its there
        
        performSegueReturnBack()
    }
    
    
    let labelNameArray : [String] = ["First Name", "Last Name", "Job Title", "Company" ,"Email", "Phone"]
    let textFieldNames : [String] = ["First name", "Last Name", "Job Title", "comany", "Email", "Phone"] // Place holder will be replaced by real data
    var dataToPass = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    func getAllCells() -> [CardDetailTableViewCell]{
        var cells = [CardDetailTableViewCell]()
        
        for i in 0...tableView.numberOfSections-1
        {
            
            for j in 0...tableView.numberOfRows(inSection:(i))
            {
                if let cell = tableView.cellForRow(at: IndexPath(row: j, section: i)){
                    cells.append(cell as! CardDetailTableViewCell)
                }
            }
        }
        return cells
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
        if segue.identifier == "saveCard" {
            if let vc = segue.destination as? CardListTableViewController {
                vc.passedCard = cardToSave
                print("Passing card")
            }
        }
    }
}
extension UIViewController {
    func performSegueReturnBack(){
        if let nav = self.navigationController{
            nav.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}
