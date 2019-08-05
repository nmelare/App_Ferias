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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        navigationItem.title = "Quero Ler"

    }

  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

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
  
        return cell
    }
        return UITableViewCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        books = findAllBooks() ?? []
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addQueroLer", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != nil {
            if segue.identifier! == "addQueroLer" {
                
                (segue.destination as! LivroInfoTableViewController).booksInfo = books[(tableView.indexPathForSelectedRow?.row)!]
                (segue.destination as! LivroInfoTableViewController).toVindoDaPesquisa = true
//                (segue.destination as! LivroInfoTableViewController).toVindoQueroLer = true
            }
        }
        
    }
}
