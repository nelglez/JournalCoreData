//
//  Posts+Convenience.swift
//  JournalCoreData
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreData

extension Post {
    @discardableResult convenience init(postDescription: String, entries: Entry, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.postDescription = postDescription
        self.entry = entries
    
    }
}
