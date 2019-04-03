//
//  PostTableViewController.swift
//  Journal
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    let postController = PostController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postController.entries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        
        let entries = postController.entries[indexPath.row]
        
        cell.textLabel?.text = entries.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.detailTextLabel?.text = dateFormatter.string(from: entries.date!)
        
        return cell
    }
    
    
    
    
   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = postController.entries[indexPath.row]
            
            postController.delete(entry: entry)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromBarButton" {
            let destination = segue.destination as? JournalTitleViewController
            destination?.postController = postController
        } else if segue.identifier == "fromCell" {
            let destinationVC = segue.destination as? ViewController
            destinationVC?.postController = postController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            destinationVC?.entries = postController.entries[indexPath.row]
            
        }
    }
    
    
}
