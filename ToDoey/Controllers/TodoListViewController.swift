//
//  ViewController.swift
//  ToDoey
//
//  Created by 平井マリア on 2019/05/01.
//  Copyright © 2019 HiraiMariaApps. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    let defaults = UserDefaults.standard
    
    var itemArray = [ItemBank]()
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New ToDoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clickes the Add Item button on our UIAlert
            
            
            let newItem = ItemBank()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New ToDoey Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
//
//    var itemArray = ["Go Grocery Shopping", "Go to Softbank", "Make Money"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem = ItemBank()
        newItem.title = "Go Softbank"
        itemArray.append(newItem)
        
        
        let newItem2 = ItemBank()
        newItem2.title = "Study"
        itemArray.append(newItem2)
        
        
        let newItem3 = ItemBank()
        newItem3.title = "Go Grocery Shopping"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [ItemBank] {
            itemArray = items
            
//        }
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoitemCell", for: indexPath)
       
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }

    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }


    
}

}
