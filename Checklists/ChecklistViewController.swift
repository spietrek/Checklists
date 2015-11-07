//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Stephen Pietrek on 11/4/15.
//  Copyright © 2015 Stephen Pietrek. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem]
    let tableIdentifier = "ChecklistItem"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        let row0item = ChecklistItem()
        row0item.text = "Learn React"
        row0item.checked = true
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Learn Angular 2"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Learn Webpack"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "Learn iOS development"
        row3item.checked = true
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Write iOS To Do app"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(tableIdentifier)
        let item = items[indexPath.row]
        cell = UITableViewCell(style: .Subtitle, reuseIdentifier: tableIdentifier)
        configureTextForCell(cell!, withChecklistItem: item)
        configureSubtitleForCell(cell!, withChecklistItem: item)
        configureCheckmarkForCell(cell!, withChecklistItem: item)
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        items.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        //let label = cell.viewWithTag(1000) as! UILabel
        //label.text = item.text
        cell.textLabel?.text = item.text    }
    
    func configureSubtitleForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        cell.detailTextLabel?.text = "This is where the subtitle will go. Does it automatically handle when the text is very long?"
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        cell.accessoryType = item.checked ? .Checkmark : .None
    }
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = ChecklistItem();
        item.text = "New Item"
        item.checked = true;
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
}

