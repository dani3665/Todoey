//
//  ViewController.swift
//  Todoey
//
//  Created by Daniel on 18/06/2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemArray = ["Test1", "Daniel", "Cool"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(UINib(nibName: "ToDoTableItemCell", bundle: self.nibBundle), forCellReuseIdentifier: "test")


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


}

