//
//  FolderTableViewController.swift
//  Megha_749456_note_p1
//
//  Created by Megha Mahna on 2019-11-09.
//  Copyright © 2019 Megha Mahna. All rights reserved.

//Github Repository Link: https://github.com/meghamahna/Megha_749456_note_p1.git

import UIKit

class FolderTableViewController: UITableViewController {
       
        var names: [String]?
        var array1: [String]?
        @IBOutlet weak var folderBarButton: UIBarButtonItem!
        @IBOutlet var tableViewData: UITableView!
        //var seperatorStyle: UITableViewCell.SeparatorStyle{get set}
        override func viewDidLoad() {
        super.viewDidLoad()
          
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false

            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
          
            self.navigationItem.rightBarButtonItem = self.editButtonItem
            names = [String]()
            array1 = [String]()
            navigationItem.rightBarButtonItem?.tintColor = UIColor.white
            navigationController?.navigationBar.barTintColor = UIColor.systemGray
            self.tableView.backgroundColor = UIColor.systemGray
            navigationController?.toolbar.barTintColor = UIColor.systemGray
//            navigationController?.navigationBar.isTranslucent = true
//            navigationController?.navigationBar.shadowImage = UIImage()
//            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

           
            
        }
        

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return names?.count ?? 0
        }
        
    // method called on clicking newFolder Button
        @IBAction func newFolderButton(_ sender: UIBarButtonItem) {
            
            let alertController = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
            alertController.addTextField { (textName) in
                textName.placeholder = "Name"
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            cancelAction.setValue(UIColor .brown, forKey: "titleTextColor")
            let addItemAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
                let name = alertController.textFields![0]
               
                if self.names!.contains(name.text!){
                        
                            let alertController1 = UIAlertController(title: "Name Taken", message: "Please choose a different name", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController1.addAction(ok)
                            self.present(alertController1, animated: true, completion: nil)
                        
                }
                        
                else {
                        
                            self.names!.append(name.text!)
 
                }
                   
                print(self.names!)
                self.array1 = self.names
                self.tableView.reloadData()
                self.tableViewData.reloadData()
                
            }
            addItemAction.setValue(UIColor.black, forKey: "titleTextColor")
            alertController.addAction(cancelAction)
            alertController.addAction(addItemAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        //method to return value in cell
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "repeat"){
                let cellName = names![indexPath.row]
                cell.textLabel?.text = cellName
                cell.imageView?.image = UIImage(named: "folder-icon")
                return cell
            
            }

            

            return UITableViewCell()
        }

        
//        override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//            view.tintColor = UIColor.systemGray
//
//        }
      
        //method to enable delete on swiping and disable on editing
        override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            if tableView.isEditing{
                return .none
            }
            else{
                return .delete
                
            }
        }
        
        //method to remove space
        override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
            return false
        }

        /*
        // Override to support conditional editing of the table view.
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        */

        
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                names!.remove(at: indexPath.row)
                tableViewData.reloadData()
            }
            
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        

        
        // Override to support rearranging the table view.
        override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        }
        

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
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            if let detail = segue.destination as? NotesTableViewController{
                detail.notesTable = self
            }
        }
        
    func update(text: [String]){
        guard array1 != nil else {return}
        array1 = text
        tableView.reloadData()
    }

}
  

