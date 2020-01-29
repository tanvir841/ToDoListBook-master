//
//  ChecklisItem.swift
//  ToDoListBook
//
//  Created by Mac on 1/26/20.
//  Copyright © 2020 JaKhushiTai. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}


