//
//  CustomCell.swift
//  ECommerce
//
//  Created by Mithun on 04/12/17.
//  Copyright © 2017 2basetechnologies. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var menuimage : UIImageView!
    @IBOutlet weak var fashionImage : UIImageView!
    @IBOutlet weak var fashionLabel : UILabel!
    @IBOutlet weak var mobileLabel : UILabel!
    @IBOutlet weak var kitchenLabel : UILabel!
    @IBOutlet weak var minusButton : UIButton!
    @IBOutlet weak var quantityLabel : UILabel!
    @IBOutlet weak var plusButton : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
