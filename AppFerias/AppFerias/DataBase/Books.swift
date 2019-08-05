//
//  Livro.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct Books: Codable {
    var title:String?
    var authors:[String]?
    var printType:String? //Diz se é Book ou magazine
    var publishedDate:String?
    var description:String?
    var pageCount:Int?
    var language:String?
    var id:String?
    var link:URL?
    var thumbnail:URL? //imagem
    var index:Int?
    
    
    public func create(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "Book" , in: managedContext)!
        
        let book = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        book.setValue(self.title, forKeyPath: "title")
        book.setValue(self.authors?[0], forKeyPath: "authors")
        book.setValue(self.publishedDate, forKeyPath: "publishedDate")
        book.setValue(self.description, forKeyPath: "descriptions")
        book.setValue(self.pageCount, forKeyPath: "pageCount")
        book.setValue(self.index, forKeyPath: "index")
        if((self.thumbnail) != nil){book.setValue(self.thumbnail?.absoluteString, forKeyPath: "image")}
        book.setValue(self.index, forKeyPath: "index")
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func update(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Book")
        
        fetchRequest.predicate = NSPredicate(format: "title = %@", self.title ?? "")
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            if(test.count != 0){
                let book = test[0] as! NSManagedObject
                
                
                book.setValue(self.title, forKeyPath: "title")
                book.setValue(self.authors?[0], forKeyPath: "authors")
                book.setValue(self.publishedDate, forKeyPath: "publishedDate")
                book.setValue(self.description, forKeyPath: "descriptions")
                book.setValue(self.pageCount, forKeyPath: "pageCount")
                if((self.thumbnail) != nil){book.setValue(self.thumbnail?.absoluteString, forKeyPath: "image")}
                book.setValue(self.index, forKeyPath: "index")
                
            } else {
                print("Object not found")
            }
            
            do {
                try managedContext.save()
            }
            catch let error as NSError {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }
    
    
    func delete(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Carts")
        
        fetchRequest.predicate = NSPredicate(format: "title = %@", self.title ?? "")
        
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            if(test.count != 0){
                let objectToDelete = test[0] as? NSManagedObject
                
                if(objectToDelete != nil){
                    managedContext.delete(objectToDelete!)
                    do{
                        try managedContext.save()
                    }
                    catch
                    {
                        print(error)
                    }
                }
            }
            else {
                print("Object not found")
            }
        }
        catch
        {
            print(error)
        }
    }
}



extension UIImageView {
    public func imageFromServerURL(urlString: String, completion: @escaping (String?, Error?) -> Void) {
        self.image = nil
        let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
        URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error as Any)
                completion(nil, error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                //                if ((self.animationImages) != nil) {
                //                    self.animationImages?.removeAll()
                //                }
                self.image = image
                completion("1", nil)
            })
            
        }).resume()
    }
}

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
}
