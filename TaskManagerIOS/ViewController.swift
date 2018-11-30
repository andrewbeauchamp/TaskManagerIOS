//
//  TableViewController.swift
//  TaskManagerIOS
//
//  Created by Andrew Beauchamp on 11/26/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var tableView: UITableView!
    let taskLibrary = TaskLibrary.sharedInstance
    
    extension ViewController: UITableViewDelegate
    
    
}

