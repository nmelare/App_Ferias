//
//  ResultadoPesquisaTableViewCell.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit

class ResultadoPesquisaTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemResultadoPesquisa: UIImageView!
    
    @IBOutlet weak var tituloResultadoPesquisa: UILabel!
    
    @IBOutlet weak var autorResultadoPesquisa: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
