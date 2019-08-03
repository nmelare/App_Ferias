//
//  deleteAll.swift
//  AppFerias
//
//  Created by Nathalia Melare on 02/08/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func deleteAll(_ entityName:String){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    
    
    do {
        let test = try managedContext.fetch(fetchRequest)
        
        if(test.count != 0){
            for data in test as! [NSManagedObject] {
                guard let objectToDelete = data as? NSManagedObject else {
                    return
                }
                managedContext.delete(objectToDelete)
                do{
                    try managedContext.save()
                }
                catch
                {
                    print(error)
                }
                
            }
        } else {
            print("Not found objects")
        }
        
    } catch {
        print("Failed")
    }
    
}
