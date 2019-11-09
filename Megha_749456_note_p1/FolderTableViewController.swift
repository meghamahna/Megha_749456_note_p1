//
//  FolderTableViewController.swift
//  Megha_749456_note_p1
//
//  Created by Megha Mahna on 2019-11-09.
//  Copyright © 2019 Megha Mahna. All rights reserved.
//

import UIKit

class FolderTableViewController: UITableViewController {
    var names: [String]?
    @IBOutlet weak var folderBarButton: UIBarButtonItem!
    @IBOutlet var tableViewData: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       //folderBarButton.setBackgroundImage(UIImage(named: "grey"), for: UIControl.State.normal, barMetrics: .default)
        //folderBarButton.setBackgroundImage(UIImage(named: ""), for: UIControl.State.normal, style: UIBarButtonItem.Style.plain, barMetrics: UIBarMetrics.default)
        //folderBarButton.setBackButtonBackgroundVerticalPositionAdjustment(CGFloat.init(bitPattern: 5), for: .default)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        names = [String]()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        //navigationController?.navigationBar.barTintColor = UIColor.systemGray
        
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
    
    @IBAction func newFolderButton(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
        alertController.addTextField { (textName) in
            textName.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addItemAction = UIAlertAction(title: "Add Item", style: .default) { (UIAlertAction) in
            let name = alertController.textFields![0]
            self.names!.append(name.text!)
            print(self.names!)
            self.tableViewData.reloadData()
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addItemAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "repeat"){
            let cellName = names![indexPath.row]
            cell.textLabel?.text = cellName
            cell.imageView?.image = UIImage(named: "folder-icon")
            return cell
        
        }

        

        return UITableViewCell()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
