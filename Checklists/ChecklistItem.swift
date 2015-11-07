//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Stephen Pietrek on 11/4/15.
//  Copyright © 2015 Stephen Pietrek. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
