//
//  ViewController.swift
//  Todoey
//
//  Created by Carlos Paredes on 2/20/23.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Finde Mike","Buy Eggs","Destoy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.todoCellName, for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = cell?.accessoryType == .checkmark ? .none : .checkmark  
        
        print(itemArray[indexPath.row])
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: Constants.addNewItem, message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: Constants.addItem, style: .default) { action in
            //what will happen once the user clicks the Add Item Button
            if let text = textField.text {
                self.itemArray.append(text)
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = Constants.createNewItem
            textField = alertTextField
        } 
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
}

