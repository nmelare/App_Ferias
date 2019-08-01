//
//  LivroInfoTableViewController.swift
//  AppFerias
//
//  Created by Nathalia Melare on 11/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit
import CoreData

protocol LivroInfoTableViewControllerDelegate {
    func update()
}

class LivroInfoTableViewController: UITableViewController {

    var booksInfo: Books?
    var context: NSManagedObjectContext?
    var book:Book?
    var delegate: LivroInfoTableViewControllerDelegate?
    
    @IBAction func botaoAdicionar(_ sender: Any) {
        guard let context = context else {
            return
        }
        self.view.endEditing(true)
            if let bookP = NSEntityDescription.insertNewObject(forEntityName: "Book", into: context) as? Book {
                bookP.title = booksInfo?.title
                bookP.authors = booksInfo?.authors?[0]
                bookP.descriptions = booksInfo?.description
                bookP.image = booksInfo?.image
                bookP.pageCount = booksInfo?.pageCount
                bookP.publishedDate = booksInfo?.publishedDate
        }
        guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        appDelegate.saveContext()
        delegate?.update()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 0
        }
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 || section == 1 {
            let view : UIView = UIView(frame: CGRect.zero)
            return view
            
        }
        if section == 2 {
            let label1 = UILabel()
            label1.text = "       Descrição"
//            label1.textColor = UIColor(red: 184/255, green: 66/255, blue: 76/255, alpha: 1)
            label1.font = UIFont.boldSystemFont(ofSize: 22.0)
            label1.backgroundColor = #colorLiteral(red: 0.9313379526, green: 0.9418647289, blue: 0.9239515662, alpha: 1)
            return label1
            
            
        }
        if section == 3 {
            let label2 = UILabel()
            label2.text = "       Detalhes"
            //            label1.textColor = UIColor(red: 184/255, green: 66/255, blue: 76/255, alpha: 1)
            label2.font = UIFont.boldSystemFont(ofSize: 22.0)
            label2.backgroundColor = #colorLiteral(red: 0.9313379526, green: 0.9418647289, blue: 0.9239515662, alpha: 1)
            return label2
            
            
        }
        return view
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }
        if section == 1 {
            return 1
        }
        if section == 2 {
            return 1
        }
        if section == 3 {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "InfoResumo") as? InfoResumoTableViewCell {
                cell.imagemLivro.image = UIImage (named: booksInfo?.image ?? "Err")
                cell.imagemLivro.layer.cornerRadius = 10
                cell.tituloLivro.text = booksInfo?.title
//                cell.tituloLivro.font = UIFont(name: "San Francisco", size: 50)
                cell.autorLivro.text = booksInfo?.authors?[0]
//                cell.autorLivro.font = UIFont(name: "San Francisco", size: 18)
                
                return cell
            }
        }
        
        if indexPath.section == 1 {
            if let cell1 = tableView.dequeueReusableCell(withIdentifier: "InfoBotao") as? InfoBotaoTableViewCell {
                cell1.botaoAdicionar.layer.cornerRadius = 10
                return cell1
            }
        }
        
        if indexPath.section == 2 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "InfoTotal") as? InfoTotalTableViewCell {
                cell2.descricaoLivro.text = booksInfo?.description
//                cell2.descricaoLivro.font = UIFont(name: "San Francisco", size: 16)
                return cell2
            }
        }
        if indexPath.section == 3 {
            if let cell3 = tableView.dequeueReusableCell(withIdentifier: "InfoMais") as? InfoTotalTableViewCell {
                cell3.pagesLivro.text = booksInfo?.pageCount
                cell3.publicacaoLivro.text = booksInfo?.publishedDate
                cell3.linguaLivro.text = booksInfo?.language
                //                cell2.descricaoLivro.font = UIFont(name: "San Francisco", size: 16)
                return cell3
            }
        }
        
        return UITableViewCell()
       
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if let context = context {
//            do {
//                let books = try context.fetch(Book.fetchRequest())
//                guard let booksTry = books as? Book else {
//                    navigationItem.title = "404"
//                    return
//                }
//                self.book = booksTry
//            }
//            catch {
//                print("Err loading books")
//                return
//            }
//        }
//        else {
//            return
//        }
//        tableView.reloadData()
//    }

    
    

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
