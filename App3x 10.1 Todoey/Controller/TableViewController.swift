//
//  ViewController.swift
//  App3x 10.1 Todoey
//
//  Created by Marwan Elbahnasawy on 04/06/2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var itemArray : [Item] = [Item(title: "a"), Item(title: "b"), Item(title: "c"), Item(title: "d"), Item(title: "e"), Item(title: "f"), Item(title: "g"), Item(title: "h")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Todoey", message: "Add a new memo", preferredStyle: .alert)
        var alertTextField = UITextField()
        let alertAction = UIAlertAction(title: "Add", style: .default) { action in
            if let safeAlertTextFieldText = alertTextField.text {
                self.itemArray.append(Item(title: safeAlertTextFieldText))
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        alert.addAction(alertAction)
        alert.addTextField { textField in
            textField.placeholder = "Memo Title"
            alertTextField = textField
        }
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done == true ? .checkmark : .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
    }
    
}

