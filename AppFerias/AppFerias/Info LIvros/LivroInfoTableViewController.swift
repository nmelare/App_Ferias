//
//  LivroInfoTableViewController.swift
//  AppFerias
//
//  Created by Nathalia Melare on 11/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit

class LivroInfoTableViewController: UITableViewController {

var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        }
        if section == 1 {
            return 1
        }
        if section == 2 {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "InfoResumo") as? InfoResumoTableViewCell {
            
            var urlString = ""
            if books[indexPath.row].thumbnail != nil {
                urlString = "\(books[indexPath.row].thumbnail as? URL))"
                //colocando imagem do livro na imagem da celula da table
                cell.imagemLivro.imageFromServerURL(urlString: urlString) { (res, err) in
                    if (err != nil) {
                        print(err as Any)
                    }
                }
            }
            cell.tituloLivro.text = books[indexPath.row].title
            
            cell.autorLivro.text = books[indexPath.row].authors?[0]
            
            return cell
        }
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: "InfoBotao") as? InfoBotaoTableViewCell {
//            mudar info do botao e salvar dados
            return cell
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTotal") as? InfoTotalTableViewCell {
            
            cell.descricaoLivro.text = books[indexPath.row].description
            
            return cell
        }
        return UITableViewCell()
       
    }
    
    
    

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

}
