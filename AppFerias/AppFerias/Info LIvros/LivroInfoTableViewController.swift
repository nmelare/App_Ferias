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
    var botaoSalvar = true
    var bookExiste = false
    var toVindoDaPesquisa = false
    var authorExiste = false
    var toVindoQueroLer = false
    var toVindoLendo = false
    
    @IBAction func botaoAdicionar(_ sender: Any) {
        
        if bookExiste {
            if booksInfo?.index == 1 {
                booksInfo?.index = 2
                booksInfo?.update()
            } else if booksInfo?.index == 2 {
                booksInfo?.index = 3
                booksInfo?.update()
            }
        } else {
            booksInfo?.create()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let title = booksInfo!.title!
        let authors = booksInfo!.authors!
        if let book:Books = (findByTitle(title)) {
            bookExiste = true
        }
        
        if let book:Books = (findByAuthors(authors[0])) {
            authorExiste = true
        }

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
                var urlString = ""
                if booksInfo?.thumbnail != nil {
                    urlString = booksInfo?.thumbnail?.absoluteString ?? ""
                    //colocando imagem do livro na imagem da celula da table
                    cell.imagemLivro.imageFromServerURL(urlString: urlString) { (res, err) in
                        if (err != nil) {
                            print(err as Any)
                        }
                    }
                }
                cell.imagemLivro.layer.cornerRadius = 10
                cell.tituloLivro.text = booksInfo?.title
                cell.autorLivro.text = booksInfo?.authors?[0]
                
                return cell
            }
        }
        
        if indexPath.section == 1 {
            if let cell1 = tableView.dequeueReusableCell(withIdentifier: "InfoBotao") as? InfoBotaoTableViewCell {
        cell1.botaoAdicionar.layer.cornerRadius = 10
                if bookExiste && authorExiste && toVindoDaPesquisa {
                    cell1.botaoAdicionar.isEnabled = false
//                    cell1.botaoAdicionar.titleLabel?.text = "Adicionar a Lendo"
                }
                return cell1
            }
        }
        
        if indexPath.section == 2 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "InfoTotal") as? InfoTotalTableViewCell {
                cell2.descricaoLivro.text = booksInfo?.description
                return cell2
            }
        }
        if indexPath.section == 3 {
            if let cell3 = tableView.dequeueReusableCell(withIdentifier: "InfoMais") as? InfoTotalTableViewCell {
//                cell3.pagesLivro.text = booksInfo?.pageCount
                cell3.publicacaoLivro.text = booksInfo?.publishedDate
                cell3.linguaLivro.text = booksInfo?.language
                return cell3
            }
        }
        
        return UITableViewCell()
       
    }
}
