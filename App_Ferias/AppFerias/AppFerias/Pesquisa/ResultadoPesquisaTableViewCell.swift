//
//  ResultadoPesquisaTableViewCell.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit

class ResultadoPesquisaTableViewCell: UITableViewCell {
    
    var books = [Book]()
    
    var tableView: UITableView!

    @IBOutlet weak var imagemResultadoPesquisa: UIImageView!
    
    @IBOutlet weak var tituloResultadoPesquisa: UILabel!
    
    @IBOutlet weak var autorResultadoPesquisa: UILabel!
    
    @IBOutlet weak var barraPesquisa: UITextField!

    
    
    @IBAction func botaoPesquisa(_ sender: Any) {
        guard let pesquisa:String = barraPesquisa.text else {
            return
        }
        
        LivroHandler.fetchFromWeb(pesquisa) { (res) in
            switch (res) {
            case .success(let books):
                self.books = books

                //Async reload
                DispatchQueue.main.async {

                    self.tableView.reloadData()
                }
            case .error(let description):
                print(description)

            }
        }
    }
    
//    let dataSource: PesquisaTableViewController = PesquisaTableViewController(books: [])
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
