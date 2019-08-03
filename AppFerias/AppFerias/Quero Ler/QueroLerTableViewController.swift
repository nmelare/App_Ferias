//
//  QueroLerTableViewController.swift
//  AppFerias
//
//  Created by Nathalia Melare on 11/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class QueroLerTableViewController: UITableViewController {
    
    var context: NSManagedObjectContext?
    
    var books: [Books] = []
    var booksApi: [Books] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        navigationItem.title = "Quero Ler"

    }

  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: "ListaQueroLer") as? ListaQueroLerTableViewCell {
        var urlString = ""
        if books[indexPath.row].thumbnail != nil {
            urlString = books[indexPath.row].thumbnail?.absoluteString ?? ""
            //colocando imagem do livro na imagem da celula da table
            cell.imagemLivroQueroLer.imageFromServerURL(urlString: urlString) { (res, err) in
                if (err != nil) {
                    print(err as Any)
                }
            }
        }
        cell.tituloLivroQueroLer.text = books[indexPath.row].title
        cell.autorLivroQueroLer.text = books[indexPath.row].authors?[0]
//        cell.imagemLivroQueroLer.image =  ?? "Erro")
//        cell.tituloLivroQueroLer.text = books[indexPath.row]?.title
//        cell.autorLivroQueroLer.text = books[indexPath.row]?.authors
        
        return cell
    }
        return UITableViewCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        books = findAllBooks() ?? []
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addFavoritos", sender: nil)
        
//        var bookSelected = books[indexPath.row]
//
//        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LivroInfo") as? LivroInfoTableViewController {
//            viewController.book = bookSelected
//
//            if let navigator = navigationController {
//                navigator.pushViewController(viewController, animated: true)
//            }
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != nil {
            if segue.identifier! == "addFavoritos" {
                
                (segue.destination as! LivroInfoTableViewController).booksInfo = books[(tableView.indexPathForSelectedRow?.row)!]
                (segue.destination as! LivroInfoTableViewController).toVindoDaPesquisa = true
                
            }
        }
        
    }

    /*
    

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LivroInfo") as? LivroInfoTableViewController {
    //
    //            if let navigator = navigationController {
    //                navigator.pushViewController(viewController, animated: true)
    //            }
    //        }
    //    }
}
