//
//  Extentions.swift
//  AppFerias
//
//  Created by Nathalia Melare on 02/08/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func findByTitle(_ title:String) -> Books? {
    
    //As we know that container is set up in the AppDelegates so we need to refer that container.
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
    
    //We need to create a context from this container
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
    fetchRequest.predicate = NSPredicate(format: "title = %@", title)
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        for data in result as! [NSManagedObject] {
            let title = data.value(forKey: "title") as? String ?? ""
            let authors = data.value(forKey: "authors") as? [String] ?? []
            let publishedDate = data.value(forKey: "publishedDate") as? String ?? ""
            let description = data.value(forKey: "descriptions") as? String  ?? ""
            let pageCount = data.value(forKey: "pageCount") as? Int ?? 0
            //            let language = data.value(forKey: "language") as? String
            let thumbnail = data.value(forKey: "image") as? String ?? ""
            
            
            
            let book = Books(title: title, authors: authors, printType: nil, publishedDate: publishedDate, description: description, pageCount: pageCount, language: nil, id: nil, link: nil, thumbnail: URL(string: thumbnail), index: 1)
            return book
        }
        
    } catch {
        print("Failed")
    }
    return nil
}

func findByAuthors(_ authors:String) -> Books? {
    
    //As we know that container is set up in the AppDelegates so we need to refer that container.
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
    
    //We need to create a context from this container
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
    fetchRequest.predicate = NSPredicate(format: "authors = %@", authors)
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        for data in result as! [NSManagedObject] {
            let title = data.value(forKey: "title") as? String ?? ""
            let authors = data.value(forKey: "authors") as? [String] ?? []
            let publishedDate = data.value(forKey: "publishedDate") as? String ?? ""
            let description = data.value(forKey: "descriptions") as? String  ?? ""
            let pageCount = data.value(forKey: "pageCount") as? Int ?? 0
            //            let language = data.value(forKey: "language") as? String
            let thumbnail = data.value(forKey: "image") as? String ?? ""
            
            
            
            let book = Books(title: title, authors: authors, printType: nil, publishedDate: publishedDate, description: description, pageCount: pageCount, language: nil, id: nil, link: nil, thumbnail: URL(string: thumbnail), index: 1)
            return book
        }
        
    } catch {
        print("Failed")
    }
    return nil
}
