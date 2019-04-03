//
//  Entries+Convenience.swift
//  JournalCoreData
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreData


extension Entry {
    @discardableResult convenience init(title: String, date: Date = Date(),
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.title = title
        self.date = date
    }
}
