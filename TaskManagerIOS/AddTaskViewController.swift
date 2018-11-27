//
//  AddTaskViewController.swift
//  TaskManagerIOS
//
//  Created by Andrew Beauchamp on 11/26/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    let calendar = Calendar.current
    
    @IBOutlet weak var addedTaskTitle: UILabel!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskDescTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addTaskTapped(_ sender: Any) {
        addTask()
    }
    
    
    func addTask () {
        guard
            let addedTitle = taskTitleTextField.text, !addedTitle.isEmpty,
            let addedDesc = taskDescTextView.text, !addedTitle.isEmpty
            else {
                let errorAlert = UIAlertController(title: "Error Detected", message: "Please fill all options", preferredStyle: UIAlertController.Style.alert)
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default ) {UIAlertAction in}
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil)
                return
        }

        let newTask = Task(title: addedTitle, description: addedDesc, status: .uncompleted(dueDate:  calendar.date(byAdding: .day, value: 14, to: Date())!))
        let addAlert = UIAlertController(title: "Task Added", message: "\(newTask.title) has been added to your library!", preferredStyle: .alert)
        let addTaskAction = UIAlertAction(title: "Thanks", style: .default)
        {UIAlertAction in
            TaskLibrary.sharedInstance.tasks.append(newTask)
            self.navigationController?.popViewController(animated: true)
            
        }
        addAlert.addAction(addTaskAction)
        self.present(addAlert, animated: true, completion: nil)

        
}
}
