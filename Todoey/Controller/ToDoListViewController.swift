//
//  ViewController.swift
//  Todoey
//
//  Created by Daniel on 18/06/2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["Test1", "Daniel", "Cool"]
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(UINib(nibName: "ToDoTableItemCell", bundle: self.nibBundle), forCellReuseIdentifier: "test")
        let restoredArr = userDefaults.array(forKey: "itemArray") as? [String]
        
        if let arr = restoredArr {
            itemArray = arr
        }
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        let selectedCell = tableView.cellForRow(at: indexPath)
        if selectedCell?.accessoryType == UITableViewCellAccessoryType.checkmark {
            selectedCell?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            selectedCell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }

        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell")
        cell?.textLabel?.text = itemArray[indexPath.row]
        
        
        return cell!
    }

    //MARK: - Add New Items
    
    @IBAction func addNewItem(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Todoey Item", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action:UIAlertAction) in
            let newItem = alert.textFields?.first?.text
            
            if let val = newItem {
                if !val.isEmpty {
                    self.itemArray.append(val)
                    self.userDefaults.set(self.itemArray, forKey: "itemArray")
                    self.tableView.reloadData()
                }
            }
            
            
        }
        
        alert.addTextField { (tf) in
            tf.placeholder = "Add a new item"
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    

}

