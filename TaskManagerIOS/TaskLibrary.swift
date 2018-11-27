//
//  TaskLibrary.swift
//  TaskManagerIOS
//
//  Created by Andrew Beauchamp on 11/27/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import Foundation

class TaskLibrary {
    //Singleton: an instance that can be shared throughout the entire app (which is neat!)
    static let sharedInstance = TaskLibrary()
    
    var tasks = [Task] ( )
}
