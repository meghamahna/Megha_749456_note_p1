//
//  NotesViewController.swift
//  Megha_749456_note_p1
//
//  Created by Megha Mahna on 2019-11-11.
//  Copyright © 2019 Megha Mahna. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var textString : String?
    weak var taskTable: NotesTableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = textString ?? ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //taskTable?.updateNote(text: textView.text)
        taskTable?.updateText(text: textView.text)
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
