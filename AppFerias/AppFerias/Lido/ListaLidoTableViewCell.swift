//
//  ListaLidoTableViewCell.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit

class ListaLidoTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemLivroLido: UIImageView!
    
    @IBOutlet weak var tituloLivroLido: UILabel!
    
    @IBOutlet weak var autorLivroLido: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
