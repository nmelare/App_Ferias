//
//  PesquisaTableViewController.swift
//  AppFerias
//
//  Created by Nathalia Melare on 11/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit
import Foundation

class PesquisaTableViewController: UITableViewController {
    
  public  var books = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellpesquisa = tableView.dequeueReusableCell(withIdentifier: "Resultado") as? ResultadoPesquisaTableViewCell {
            return cellpesquisa
        }
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultadoPesquisa") as? ResultadoPesquisaTableViewCell {
            var urlString = ""
            if books[indexPath.row].thumbnail != nil {
                urlString = "\(books[indexPath.row].thumbnail as? URL))"
                //colocando imagem do livro na imagem da celula da table
                cell.imagemResultadoPesquisa.imageFromServerURL(urlString: urlString) { (res, err) in
                    if (err != nil) {
                        print(err as Any)
                    }
                }
            }
            cell.tituloResultadoPesquisa.text = books[indexPath.row].title
            cell.autorResultadoPesquisa.text = books[indexPath.row].authors?[0]
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
//    func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
//
//    func filterContentForSearchText(_ searchText: String) {
//        LivroHandler.fetchFromWeb(searchText) { (res) in
//            switch (res) {
//            case .success(let books):
//                self.books = books
//                //Async reload
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//
//                }
//            case .error(let description):
//                print(description)
//
//
//            }
//        }
//
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

