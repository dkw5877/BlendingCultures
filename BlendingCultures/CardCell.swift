//
//  CardCell.swift
//  BlendingCultures
//
//  Created by user on 12/13/16.
//  Copyright © 2016 someCompanyNameHere. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {


    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    func fillWith(card:Card) {
        rankLabel.textColor = card.color
        rankLabel.text = card.rank.description
        suiteLabel.text = card.suit.description
    }
}
