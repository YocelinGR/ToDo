//
//  ViewController.swift
//  ToDoApp
//
//  Created by Apple Device 21 on 11/2/19.
//  Copyright © 2019 YocelinGR. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var ToDoArr = ToDo.getToDos()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    navigationItem.leftBarButtonItem = editButtonItem
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoArr?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. crear celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "UiTableViewCell", for: indexPath)
        
        cell.textLabel?.text = "\(ToDoArr[indexPath.row].title)"
        
        return cell
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ToDoArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            ToDo.saveToDos(ToDoArr)
        }
    }
    
    @IBAction func unwindToToDoTableViewControllerCancel(_ segue: UIStoryboardSegue) {
    }
    @IBAction func unwindToTodoTableViewControllerSave(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "Save" {
            let sourceVC = unwindSegue.source as! ToDoDetailController
            
            guard let toDo = sourceVC.toDo else {return}
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                ToDoArr[selectedIndexPath.row] = toDo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                ToDo.saveToDos(ToDoArr)
            } else {
                let newIndexPath = IndexPath(row: ToDoArr.count, section: 0)
                ToDoArr.append(toDo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                ToDo.saveToDos(ToDoArr)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetails" else {return}
        
        let navController = segue.destination as! UINavigationController
        
        let todoViewController = navController.topViewController as! ToDoDetailController
        guard let newIndexPath = tableView.indexPathForSelectedRow else {return}
        let selectedTodo = ToDoArr[newIndexPath.row]
        print(selectedTodo.title)
        todoViewController.toDo = selectedTodo
    }
    
    
}

