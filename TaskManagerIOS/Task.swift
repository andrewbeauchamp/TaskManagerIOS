//
//  Task.swift
//  TaskManagerIOS
//
//  Created by Andrew Beauchamp on 11/26/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import Foundation

class Task {
    
    let calendar = Calendar.current
    
    let title: String
    let description: String
    var status: Status
    
    enum Status {
        case completed
        case uncompleted (dueDate: Date)
    }
    
    init(title: String, description: String, status: Status) {
        self.description = description
        self.title = title
        self.status = .uncompleted(dueDate: calendar.date(byAdding: .day, value: 14, to: Date())!)
    }
    
}
