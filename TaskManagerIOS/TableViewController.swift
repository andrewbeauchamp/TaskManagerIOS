//
//  TableViewController.swift
//  TaskManagerIOS
//
//  Created by Andrew Beauchamp on 11/27/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import UIKit


class TableViewController: UIViewController {
    
    let taskLibrary = TaskLibrary.sharedInstance
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskLibrary.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath) as! TaskCell
        let task = taskLibrary.tasks[indexPath.row]
        cell.setUP(task: task)
        
        
        return cell
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = taskLibrary.tasks[indexPath.row].description
        let errorAlert = UIAlertController(title: "Description", message: "\(selectedTask)", preferredStyle: UIAlertController.Style.alert)
        let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default ) {UIAlertAction in}
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
        return
    }
    
    
    
    
    
    //
    //This block of code is made to show the user if they can delete complete or uncomplete a task
    //
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            TaskLibrary.sharedInstance.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
        
        let task = taskLibrary.tasks[indexPath.row]
        
        
        
        //This function allows the user to uncomplete a task they have already completed
        func unCompleted(at indexPath: IndexPath) {
            let task = self.taskLibrary.tasks[indexPath.row]
            
            let calendar = Calendar(identifier: .gregorian)
            let dueDate = calendar.date(byAdding: .day, value: 14, to: Date())!
            
            task.status = .uncompleted(dueDate: dueDate)
            (tableView.cellForRow(at: indexPath) as! TaskCell).setUP(task: task)
        }
        
        
        
        //This function allows the user to complete an uncompleted task from the table view
        func completed(at indexPath: IndexPath) {
            let task = self.taskLibrary.tasks[indexPath.row]
            task.status = .completed
            (tableView.cellForRow(at: indexPath) as! TaskCell).setUP(task: task)
        }
            
            
            
            // If the game is checked out, we create and return the check in action.
            // If the game is checked in, we create and return the check out action.
            
            
            
            switch task.status {
            case .completed:
                let uncompletedAction = UITableViewRowAction(style: .normal, title: "Uncompleted") { _, indexPath in
                    
                    unCompleted(at: indexPath)
                    
                }
                
                return [uncompletedAction, deleteAction]
                
            case .uncompleted:
                let completedAction = UITableViewRowAction(style: .normal, title: "Completed") { _, indexPath in
                    completed(at: indexPath)
                }
                
                return [completedAction, deleteAction]
            }
        }
}


