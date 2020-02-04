//
//  AdditemViewController.swift
//  ToDoListBook
//
//  Created by Tanvir on 1/26/20.
//  Copyright © 2020 JaKhushiTai. All rights reserved.
//

import UIKit

protocol HomeTableViewControllerDelegate: class {
  func addItemViewControllerDidCancel(_ controller: AdditemViewController)
    func addItemViewController(_ controller: AdditemViewController, didFinishAdding item: ChecklistItem)
}

class AdditemViewController: UITableViewController, UITextFieldDelegate{

        
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var donebarButton: UIBarButtonItem!
    weak var delegate: HomeTableViewControllerDelegate?
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
    return true
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
    replacementString string: String) -> Bool {
    let oldText = textField.text!
    let stringRange = Range(range, in:oldText)!
    let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
    donebarButton.isEnabled = !newText.isEmpty
        
    return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    
    @IBAction func doNe(_ sender: Any) {
        
        let item = ChecklistItem()
        if textField.text == ""
        {
            let alert = UIAlertController(title: "Insert something", message: "You haven't added anthing", preferredStyle: .alert)
           // let action = UIAlertAction(title: "Add Item", style: .default)
            present(alert, animated: true){
            sleep(1)
            alert.dismiss(animated: true)
        }
        }
        else{
        item.text = textField.text!
//        HomeTableViewController.add(items)
        dismiss(animated: true, completion: nil)
        delegate?.addItemViewController(self, didFinishAdding: item)
        }
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
    }

}
