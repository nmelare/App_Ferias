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

    let searchController = UISearchController(searchResultsController: nil)
    
    var books: [Books] = []
    
    var filterBook: [Books] = []
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.searchResultsUpdater = self
//        searchController.searchBar.tintColor = .init(red: 157/255, green: 20/255, blue: 28/255, alpha: 1)
//        searchController.searchBar.placeholder = "Pesquisar dica"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        books = Intern.getAllBooks()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filterBook.count
        }
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultadoPesquisa") as? ResultadoPesquisaTableViewCell {
            
            if isFiltering(){
                cell.imagemResultadoPesquisa.image = UIImage(named: filterBook[indexPath.row].image ?? "Erro")
                cell.tituloResultadoPesquisa.text = filterBook[indexPath.row].title
//                cell.tituloResultadoPesquisa.font = UIFont(name: "San Francisco", size: 30)
                cell.autorResultadoPesquisa.text = filterBook[indexPath.row].authors?[0]
//                cell.autorResultadoPesquisa.font = UIFont(name: "San Francisco", size: 18)
            }
            let oneBook = books[indexPath.row]
            cell.imagemResultadoPesquisa.image = UIImage(named: oneBook.image ?? "Erro")
            cell.tituloResultadoPesquisa.text = oneBook.title
//            cell.tituloResultadoPesquisa.font = UIFont(name: "San Francisco", size: 30)
            cell.autorResultadoPesquisa.text = oneBook.authors?[0]
//            cell.autorResultadoPesquisa.font = UIFont(name: "San Francisco", size: 18)
            
            return cell
                }
  
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var bookSelected = books[indexPath.row]

        if isFiltering() {
            bookSelected = filterBook[indexPath.row]
        }
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LivroInfo") as? LivroInfoTableViewController {
            viewController.booksInfo = bookSelected

            viewController.book?.image = bookSelected.image
            viewController.book?.authors = bookSelected.authors![0]
            viewController.book?.descriptions = bookSelected.description
            viewController.book?.pageCount = bookSelected.pageCount
            viewController.book?.publishedDate = bookSelected.publishedDate
            viewController.book?.title = bookSelected.title
            
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
       
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filterBook = books.filter({ (oneBook:Books) -> Bool in
            for title in oneBook.title ?? "Err" {
                if title.lowercased().contains(searchText.lowercased()) {
                    return true
                }}
            return false
        })
            tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
extension PesquisaTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
