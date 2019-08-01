//
//  Book+CoreDataProperties.swift
//  AppFerias
//
//  Created by Nathalia Melare on 30/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var authors: String?
    @NSManaged public var publishedDate: String?
    @NSManaged public var pageCount: String?
    @NSManaged public var index: Int32

}
