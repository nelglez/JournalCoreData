//
//  PostController.swift
//  JournalCoreData
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreData

class PostController {
    
    var entries: [Entry] {
        
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return (try? CoreDataStack.shared.mainContext.fetch(request)) ?? []
    }
    
    //MARK: - CRUD Todo
    
    func create(entriesWith title: String) {
        let _ = Entry(title: title)
        saveToPersistentStore()
    }
    
    func updateTodoTitle(entry: Entry, title: String) {
        entry.title = title
        saveToPersistentStore()
    }
    
    func delete(entry: Entry) {
        if let moc = entry.managedObjectContext {
            moc.delete(entry)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.shared.mainContext
        do {
            try moc.save()
        } catch let error {
            print("There was a problem saving to the persistent store: \(error)")
        }
    }
    
    
    //MARK: - CRUD Posts
    
    func create(postWith description: String, entry: Entry) {
        let _ = Post(postDescription: description, entries: entry)
        saveToPersistentStore()
    }
    
    func delete(post: Post) {
        if let moc = post.managedObjectContext {
            moc.delete(post)
            saveToPersistentStore()
        }
    }
    
    
    
    
}
