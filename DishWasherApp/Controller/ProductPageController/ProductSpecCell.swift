//
//  TableViewCell.swift
//  DishWasherApp
//
//  Created by Zensar Technologies1 on 24/02/17.
//  Copyright © 2017 Shashank Dekate. All rights reserved.
//

import UIKit

class ProductSpecCell: UITableViewCell {

    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var techLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
