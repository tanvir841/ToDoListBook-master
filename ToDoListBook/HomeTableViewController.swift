//
//  ViewController.swift
//  ToDoListBook
//
//  Created by Mac on 1/25/20.
//  Copyright © 2020 JaKhushiTai. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, HomeTableViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AdditemViewController)
    {
    navigationController?.popViewController(animated:true)
        
    }
    
    
//    var row0checked = false
//    var row1checked = false
//    var row2checked = false
//    var row3checked = false
//    var row4checked = false
    
    var row0item = ChecklistItem()
    var row1item = ChecklistItem()
    var row2item = ChecklistItem()
    var row3item = ChecklistItem()
    var row4item = ChecklistItem()
    
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        items.append(item5)
        
        tableView.reloadData()
        
        //navigationController?.navigationBar.prefersLargeTitles = true        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lists", for: indexPath)
        
        // cell.textLabel?.text = "Cool Effects \(indexPath.row)"
//        let label = cell.viewWithTag(1000) as! UILabel
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        cell.textLabel?.text = item.text
        return cell
    }
    func configureText(for cell: UITableViewCell,
                      with item: ChecklistItem) {
        
        cell.textLabel?.text = item.text
        
    }
    
    func configureCheckmark( for cell: UITableViewCell, with item: ChecklistItem){
        
        if item.checked
        {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {

            let item = items[indexPath.row]
            item.checked = !item.checked

            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func addItemViewController(_ controller: AdditemViewController,didFinishAdding item: ChecklistItem) {
        let newRowIndex = items.count
        items.append(item)
        print(item.text)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated:true)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem"{
            let controller = segue.destination as! AdditemViewController
            controller.delegate = self
            
        }
    }
}

