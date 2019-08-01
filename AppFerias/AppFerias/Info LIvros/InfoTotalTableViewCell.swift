//
//  InfoTotalTableViewCell.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit

class InfoTotalTableViewCell: UITableViewCell {

    @IBOutlet weak var descricaoLivro: UILabel!
    
    @IBOutlet weak var pagesLivro: UILabel!
    
    @IBOutlet weak var publicacaoLivro: UILabel!
    
    @IBOutlet weak var linguaLivro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
