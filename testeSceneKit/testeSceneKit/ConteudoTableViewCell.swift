//
//  ConteudoTableViewCell.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 28/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import UIKit

class ConteudoTableViewCell: UITableViewCell {

    @IBOutlet weak var marcadorImage: UIImageView!
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
