//
//  ProgressoTableViewCell.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import UIKit

class ProgressoTableViewCell: UITableViewCell {

    @IBOutlet weak var topicoLabel: UILabel!
    @IBOutlet weak var progressoLabel: UILabel!
    @IBOutlet weak var barraProgressoView: BarraProgressoView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
