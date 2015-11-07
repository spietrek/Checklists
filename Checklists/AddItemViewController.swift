//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Stephen Pietrek on 11/5/15.
//  Copyright © 2015 Stephen Pietrek. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
