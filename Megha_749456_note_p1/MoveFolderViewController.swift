//
//  MoveFolderViewController.swift
//  Megha_749456_note_p1
//
//  Created by Megha Mahna on 2019-11-14.
//  Copyright © 2019 Megha Mahna. All rights reserved.
//

import UIKit

class MoveFolderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var notesDelegate : NotesTableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Folder.folders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard Folder.folders.count != 0 else{
            return UITableViewCell()
        }
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
        cell.textLabel?.text = Folder.folders[indexPath.row].folderName
        cell.backgroundColor = UIColor.systemGray
        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController2 = UIAlertController(title: " move to \(Folder.folders[indexPath.row].folderName)", message: "Are  you sure", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "Move", style: .default)
        { (action) in
            
             self.notesDelegate?.moveNotes(index: indexPath.row)
             self.presentingViewController?.dismiss(animated: true, completion: nil)
            
        }
            
        alertController2.addAction(okAction)
        alertController2.addAction(cancelAction)
        self.present(alertController2, animated: true, completion:  nil)
                           
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        
         self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
