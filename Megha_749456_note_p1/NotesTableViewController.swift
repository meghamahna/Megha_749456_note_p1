//
//  NotesTableViewController.swift
//  Megha_749456_note_p1
//
//  Created by Megha Mahna on 2019-11-11.
//  Copyright © 2019 Megha Mahna. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    @IBOutlet weak var trashButton: UIBarButtonItem!
   
    @IBOutlet weak var moveNotesButton: UIBarButtonItem!
    
    var selectedRows: [IndexPath]?
    var notesString : String?
    var curIndex = -1
    var notesTable : FolderTableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
        trashButton.isEnabled = false
        moveNotesButton.isEnabled = false
    
    }
//    func initialise(folderName: String, notes : [String] = []){
//    
//        folderNotes.folderName = folderName
//        
//    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  Folder.folders[(notesTable?.curIndex)!].notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            if let cell = tableView.dequeueReusableCell(withIdentifier: "normal"){
                       if let label = cell.viewWithTag(2) as? UILabel{
                        label.text = Folder.folders[(notesTable?.curIndex)!].notes[indexPath.row]
                       
                       }
                       return cell
            }
        return UITableViewCell()
    }
    
//    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        if let oldIndex = tableView.indexPathForSelectedRow {
//            tableView.cellForRow(at: oldIndex)?.accessoryType = .none
//        }
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//
//        return indexPath
//    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
             if let detailView = segue.destination as? NotesViewController {
                       detailView.taskTable = self
                       if let tableViewCell = sender as? UITableViewCell {
                           if let index = tableView.indexPath(for: tableViewCell)?.row {
                                    detailView.textString = Folder.folders[(notesTable?.curIndex)!].notes[index]
                                    curIndex = index
                           }
                       }
        }
                if let moveFolder = segue.destination as? MoveFolderViewController{
                    moveFolder.notesDelegate = self
                
                   }
        // Get the new view controller using segue.destination.
               // Pass the selected object to the new view controller.
        }
        func updateText(text: String){
            
            if  curIndex != -1 {
                Folder.folders[(notesTable?.curIndex)!].notes[curIndex] = text
                let indexPath = IndexPath(item: curIndex, section: 0)
                tableView.reloadRows(at: [indexPath], with: .none)
                curIndex = -1
            }
            
            else if curIndex == -1{
                Folder.folders[(notesTable?.curIndex)!].notes.append(text)
                tableView.reloadData()
                notesTable?.reloadFolders()
                
                return
            }
        
    }
            
    func moveNotes(index: Int){
        
        selectedRows = tableView.indexPathsForSelectedRows!
        
        for i in selectedRows!{
            let move = Folder.folders[(notesTable?.curIndex)!].notes[i.row]
            Folder.folders[index].notes.append(move)
        }
        
        deleteRows()
    }
    
    func deleteRows(){
        
        selectedRows = tableView.indexPathsForSelectedRows!
        var items = [String]()
        for indexpath in selectedRows!{
            
            items.append(Folder.folders[(notesTable?.curIndex)!].notes[indexpath.row])
            
        }
        
        for value in items{
            
            if let index = Folder.folders[(notesTable?.curIndex)!].notes.firstIndex(of: value)
            {
                Folder.folders[(notesTable?.curIndex)!].notes.remove(at: index)
            }
        }
        tableView.reloadData()
        notesTable?.tableView.reloadData()
    }


    
    @IBAction func dotsButton(_ sender: Any) {
        
        if trashButton.isEnabled == false && moveNotesButton.isEnabled == false{
               
                                 trashButton.isEnabled = true
                                 moveNotesButton.isEnabled = true
               
                             }

                             else if  trashButton.isEnabled == true && moveNotesButton.isEnabled == true{

                                 trashButton.isEnabled = false
                                 moveNotesButton.isEnabled = false

                             }
    }
    
    @IBAction func trashButtonAction(_ sender: UIBarButtonItem) {
        let alertcontroller = UIAlertController(title: "Delete ", message: "Are you sure", preferredStyle: .alert)
          
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        CancelAction.setValue(UIColor.brown, forKey: "titleTextColor")
        let trashItemAction = UIAlertAction(title: "Delete", style: .default)
        {(action1) in
           
           if let selectedRows = self.tableView.indexPathsForSelectedRows {
        
           var items = [String]()
           for indexPath in selectedRows  {
            items.append(Folder.folders[(self.notesTable?.curIndex)!].notes[indexPath.row])
           }
           for item in items {
            if let index = Folder.folders[(self.notesTable?.curIndex)!].notes.lastIndex(of: item) {
                Folder.folders[(self.notesTable?.curIndex)!].notes.remove(at: index)
               }
           }
               self.tableView.deleteRows(at: selectedRows, with: .automatic)
               self.tableView.reloadData()
           }
           }
                        trashItemAction.setValue(UIColor.red, forKey: "titleTextColor")
                        alertcontroller.addAction(CancelAction)
                        alertcontroller.addAction(trashItemAction)
                        self.present(alertcontroller, animated: true, completion: nil)
    }
    
   
    
   

   
}
    


