//
//  TaskCell.swift
//  TaskManagerIOS
//
//  Created by Andrew Beauchamp on 11/26/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import Foundation
import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var tasktTitleLabel: UILabel!
    @IBOutlet weak var taskDueDateLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    func setUP (task: Task) {
        tasktTitleLabel.text = task.title
        
        switch task.status {
        case.completed:
            //Hide due date
            taskDueDateLabel.isHidden = true
            //Change color to green
            statusView.backgroundColor = .green
            
        case.uncompleted(let date):
            //show due date
            taskDueDateLabel.isHidden = false
            //change color to red
            statusView.backgroundColor = .red
            let datFormatter = DateFormatter()
            datFormatter.dateFormat = "MM/dd/yyyy"
            taskDueDateLabel.text = datFormatter.string(from: date)
        }
        
    }
}




