//
//  InfoResumoTableViewCell.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit

class InfoResumoTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemLivro: UIImageView!
    
    @IBOutlet weak var tituloLivro: UILabel!
    
    @IBOutlet weak var autorLivro: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
